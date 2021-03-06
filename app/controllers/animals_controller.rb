class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :delete]

  def index
    @animals = Animal.all.order(created_at: :desc)
    if params[:query].present?
      sql_query = "race ILIKE :query OR description ILIKE :query"
      @animals = Animal.where(sql_query, query: "%#{params[:query]}%")
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @reservation = Reservation.new
    # authorize @animal

    @localisations = User.geocoded
    @markers = @localisations.map do |localisation|
      {
        lat: localisation.latitude,
        lng: localisation.longitude
      }
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def destroy
    @current_user = Animal.where(user: current_user)
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to animals_path
    # authorize @animal
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :race, :description, :photo)
  end
end

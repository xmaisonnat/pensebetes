class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]
  before_action :set_reservation, only: [:owner_index, :accept, :decline, :destroy]
  def index
    @reservations = Reservation.where(user: current_user)
    # @reservations = policy_scope(Reservation).order(created_at: :desc)
  end

  def owner_index
    @reservations = Reservation.where(user: current_user)
    @reservations
  end

  def accept
    authorize @reservation
  end

  def decline
    authorize @reservation
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.animal = @animal
    @reservation.user_id = current_user[:id]
    authorize @reservation
    if @reservation.save
      redirect_to reservations_path(@reservation), notice: "#{@animal.name} a été seléctionné(e)!"
    else
      render "animals/show"
    end
  end

  def destroy
    record.user
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def reservation_params
    params.require(:reservation).permit(:date, :status, :user_id, :animal_id)
  end
end

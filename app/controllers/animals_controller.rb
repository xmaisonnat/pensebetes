class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = policy_scope(Animal).order(created_at: :desc)
  end

  def show
    @animal = Animal.find(params[:id])
    authorize @animal
  end
end

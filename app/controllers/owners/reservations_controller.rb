class Owners::ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :destroy]
  # before_action :set_reservation, only: [:index, :accept, :create, :decline, :destroy]

  def index
    @reservations = policy_scope(Reservation).order(created_at: :desc)
    # @reservations = Reservation.where(user: current_user)
    @reservations = Animal.where(user: current_user)
    @reservations
  end
end

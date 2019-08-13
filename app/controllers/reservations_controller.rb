class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  befire_action :set_reservation, only: [:accept, :decline, :destroy]
  def index
    @reservations = policy_scope(Reservation).order(created_at: :desc)
  end

  def accept?
    authorize @reservation
  end

  def decline?
    authorize @reservation
  end

  def destroy?
    record.user
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end
end

class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_reservation, only: [:owner_index, :accept, :decline, :destroy]
  def index
    @reservations = policy_scope(Reservation).order(created_at: :desc)
  end

  def owner_index?
    @reservations = Reservation.where(user == current_user.id)
    @reservations
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

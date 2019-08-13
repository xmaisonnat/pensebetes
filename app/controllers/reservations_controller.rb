class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @reservations = Reservation.all
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




end

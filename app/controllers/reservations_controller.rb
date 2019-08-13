class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @reservations = Reservation.all
  end






end

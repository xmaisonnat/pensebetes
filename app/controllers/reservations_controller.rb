class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @reservations = Reservation.all
  end

<<<<<<< HEAD
  def accept?
    authorize @reservation
  end

  def decline?
    authorize @reservation
  end
=======



>>>>>>> 71c81fd3216faeedee9cebfca301b90421f62d23


end

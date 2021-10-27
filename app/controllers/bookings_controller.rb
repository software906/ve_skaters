class BookingsController < ApplicationController
   before_action :set_skate, only: [:new, :create, :destroy]

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.skate = @skate
    @booking.user = current_user
    @booking.status = true
    authorize @skate
    if @booking.save
      redirect_to skate_path(@skate)
    else
      redirect_to skates_path
    end

  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:skate_id, :time_from, :descripcion)
  end

  def set_skate
    @skate = Skate.find(params[:skate_id])
  end

end

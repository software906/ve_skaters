class BookingsController < ApplicationController
  before_action :skip_authorization, only: [:destroy, :status]
  before_action :set_skate, only: [:new, :create, :update, :destroy]
  #skip_before_action :
  def new
  end

  def create
    authorize @skate
    @booking = Booking.new(booking_params)
    @booking.skate = @skate
    @booking.price_total = @skate.precio_dia
    @booking.user = current_user
    # @booking.status = true
    # @booking.compled = false
    if @booking.save
      redirect_to skate_path(@skate)
    else
      render 'skates/show'
    end
  end

  def update
  end

  def status
    @booking = Booking.find(params[:id])
    @booking.status = false
    @booking.save
    puts params
    redirect_to skate_path(params[:skate_id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to skates_path
  end

  private

  def booking_params
    params.require(:booking).permit(:skate_id, :time_from, :descripcion)
  end

  def set_skate
    @skate = Skate.find(params[:skate_id])
  end

end

class BookingsController < ApplicationController
  before_action :skip_authorization, only: [:destroy, :status]
  before_action :set_skate, only: [:new, :create, :update, :destroy]
  #skip_before_action :
  def new
  end

  def create
    authorize @skate
    #if Booking.find_by(skate_id: @skate, time_from: params[:time_from])
      @booking = Booking.new(booking_params)
      @booking.skate = @skate
      @booking.user = current_user
      @booking.status = true
      if @booking.save
        redirect_to skate_path(@skate)
      else
        render 'skates/show'
      end
    #else
    #  redirect_to skate_path(@skate)
    #end
  end

  def update

  end

  def status
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
    redirect_to skates_path
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

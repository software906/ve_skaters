class SkatesController < ApplicationController
  before_action :set_skate, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @skates = policy_scope(Skate.all)
    @skates = Skate.filter_by_price_desc if (params[:filter] == "price-desc")
    @skates = Skate.filter_by_price_asc if (params[:filter] == "price-asc")
    @skates = Skate.location if (params[:filter] == "ubicacion")
    
  end

  def show
    @booking = Booking.new
    @review = Review.new(skate: @skate)
    @markers = {
                lat: @skate.latitude,
                lng: @skate.longitude,
                info_window: render_to_string(partial: "info_window", locals: { skate: @skate })
              }
    
  end

  def new
    @skate = Skate.new
    authorize @skate
  end

  def create
    @skate = Skate.new(skate_params)
    @skate.user = current_user
    authorize @skate
    if @skate.save
      redirect_to skates_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_skate
    @skate = Skate.find(params[:id])
    authorize @skate
  end

  def skate_params
    params.require(:skate).permit(:precio_dia, :ubicacion, :descripcion, photos: [])
  end
end

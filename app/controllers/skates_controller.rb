require 'user_ip'

class SkatesController < ApplicationController
  before_action :set_skate, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @skates = policy_scope(Skate.all)
    @skates = Skate.filter_by_price_desc if (params[:filter] == "price-desc")
    @skates = Skate.filter_by_price_asc if (params[:filter] == "price-asc")
    @skates = Skate.location if (params[:filter] == "ubicacion")
    @skates = @skates.filter_by_search(params[:search]) if params[:search]
    @skates = @skates.filter_by_zona(params[:zona]) if params[:zona]
    @yo = UserIp.new(@skates[1]).user_pos
    @tu = UserIp.new(@skates[1]).skate_pos
    @skates.each do |skate|
        usuario = UserIp.new(skate)
        skate.user_skate_pos = usuario.distancia
    end
    
  end

  def show
    @booking = Booking.new
    usuario = UserIp.new(@skate)    
    @review = Review.new(skate: @skate)
    @marker_skate = {
                lat: @skate.latitude,
                lng: @skate.longitude,
                info_window: render_to_string(partial: "info_window", locals: { skate: @skate })
              }
    @marker_user = {
                lat: usuario.user_pos[0],
                lng: usuario.user_pos[1],                
              }   

    @reservado = false
    @review_act = false
    @reserva = Booking.find_by(skate_id: @skate, user_id: current_user, status: true)
    if @reserva.present?
      @reservado = true
    end
    if Booking.find_by(skate_id: @skate, user_id: current_user, status: false)

      @review_act = true
    end
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

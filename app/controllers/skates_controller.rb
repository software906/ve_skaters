require 'user_ip'

class SkatesController < ApplicationController
  before_action :set_skate, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @skates = policy_scope(Skate.all)
    @skates = Skate.filter_by_price_desc if (params[:filter] == "price-desc")
    @skates = Skate.filter_by_price_asc if (params[:filter] == "price-asc")
    @skates = Skate.location if (params[:filter] == "ubicacion")
    @skates = @skates.filter_by_zona(params[:zona]) if params[:zona]     

    @skates = @skates.filter_by_categoria(params[:categoria]) if params[:categoria]
    @skates = @skates.search_by_ubicacion_and_descripcion(params[:search]) if params[:search].present?    
   
    @pagy, @skates = pagy(@skates, items: 8)
    @skates.each do |skate|
      if skate.present?
        usuario = UserIp.new(skate)
        skate.user_skate_pos = usuario.distancia
      end
    end 
    @skates = @skates.sort_by { |skate| skate.user_skate_pos } if (params[:filter] == "cercania")
    

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
    @reserva = nil
    @reserva = Booking.find_by(skate_id: @skate, user_id: current_user, status: true)
    if @reserva.present?
      @reservado = true
      @booking = Booking.find_by(skate_id: @skate, user_id: current_user, status: true)
      @c_u = current_user.id
    end
    if Booking.find_by(skate_id: @skate, user_id: current_user, status: false, compled: true)
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
    params.require(:skate).permit(:precio_dia, :ubicacion, :descripcion, :categoria, photos: [])
  end
end

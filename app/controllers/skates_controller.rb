class SkatesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @skates = Skate.all
  end

  def show
  end

  def new
    @skate = Skate.new
  end

  def create
    @skate = Skate.new(skate_params)
    @skate.user = current_user
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

  def skate_params
    params.require(:skate).permit(:precio_dia, :ubicacion, :descripcion, photos: [])
  end
end

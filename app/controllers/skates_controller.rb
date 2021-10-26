class SkatesController < ApplicationController
  before_action :set_skate, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @skates = policy_scope(Skate.all)
  end

  def show
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

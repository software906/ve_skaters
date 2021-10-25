class SkatesController < ApplicationController
  skip_before_action :autheticate_user!, only: [:index]

  def index
    @skates = Skate.all
  end

  def show
  end

  def new
    @skate = Skate.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end

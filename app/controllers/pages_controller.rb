class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @my_skates = Skate.where(user_id: current_user)
    @my_bookings = Booking.where(user_id: current_user)
    @a = Booking.all
    @my_cash = @a.select do |book|
      book.skate.user_id == current_user.id
    end
  end
end

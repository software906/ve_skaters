class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @my_skates = Skate.where(user_id: current_user)
    @my_bookings = Booking.where(user_id: current_user)
    @a = Booking.all
    @rents = @a.select do |book|
      book.skate.user_id == current_user.id
    end
    @pagy, @my_skates = pagy(@my_skates, items: 3)
  end
end

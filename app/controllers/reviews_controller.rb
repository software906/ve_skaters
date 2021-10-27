class ReviewsController < ApplicationController
    def create
      @review = Review.new(review_params)
      @skate = Skate.find(params[:skate_id])
      @review.skate = @skate
      if @review.save
        redirect_to skate_path(@skate)
      else
        render 'skates/show'
      end
    end
  
    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to skate_path(@review.skate)
    end
  
    private
  
    def review_params
      params.require(:review).permit(:comment, :rating)
    end
  
  end
  
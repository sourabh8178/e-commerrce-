class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end


  def show
  	@review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

   private

    def review_params
      params.require(:review).permit(:product_id, :comment, :rating, :image)
    end




end
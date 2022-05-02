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
    @order_booking = OrderBooking.all
    # byebug
    review = Review.new
    review.rating = params[:rating ]
    review.comment = params[:review][:comment]
    review.user_id = current_user.id
    review.order_id = current_user.order_booking_ids
    # review.product_id = params[:product_ids]
    review.save
    # @review = Review.new(review_params)
    # respond_to do |format|
    #   if @review.save
    #     format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
    #     format.json { render :show, status: :created, location: @review }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @review.errors, status: :unprocessable_entity }
    #   end
    # end
    redirect_to orders_path
  end

   private

    def review_params
      params.require(:review).permit(:comment, :rating)
    end
end
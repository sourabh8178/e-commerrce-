class OrdersController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
  end

  def show
    
  end

  def cancel 
    # byebug
    order = OrderBooking.find_by(id: params[:order_id])
    Stripe.api_key = 'sk_test_51KWwrwSJkerzRPBUxkXVy9PTD9clPnX2KrEycutGuZxdFULjpNu1W6Lev5jSpYUmCc99SumqCo3JKOUD2mYr2nvD00UY2qQ9hk'
    if order.cash_on_delivery == true
    else
    # Stripe::Refund.create(payment_intent: order.payment_intent, amount: 100)
    OrderStatus.create(order_id: params[:order_id], status: "cancelled", refund: "NotApplicabel")
    end
    OrderStatus.create(order_id: params[:order_id], status: "cancelled", refund: "progress")
    redirect_to orders_path
  end
end

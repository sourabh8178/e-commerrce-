class OrdersController < ApplicationController
  def index
  end

  def cancel 
    OrderStatus.create(order_id: params[:order_id], status: "cancelled")
    redirect_to orders_path
  end
end

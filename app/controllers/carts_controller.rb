class CartsController < ApplicationController
  # skip_before_action :authenticate_user!
  def index
    if current_user.cart.present?
      @cart = current_user.cart
    else  
      @cart = Cart.create(user_id: current_user.id)
    end 
    @cart_items = @cart.cart_items
  end


  def create
    @carts = Cart.create(name: params[:form][:name], email: params[:current_user.email])
    CartshopMailer.cart_mail(@carts).deliver_now 
    redirect_to homes_path
  end

end

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def add_to_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else  
      @cart = Cart.create(user_id: current_user.id)
    end  
    @product = Product.find_by(id: params[:product_id])
    @cart.add(@product, @product.price)
    redirect_to carts_path
  end

  def remove_to_cart
    @cart = current_user.cart
    @product = Product.find_by(id: params[:product_id])
    @cart.remove(@product, 1)
    redirect_to carts_path
  end

  def add_to_wishlist
    @product = Product.find_by(id: params[:product_id])
    Wishlist.create(user_id: current_user.id, product_id: params[:product_id])
    redirect_to wishlists_path
  end

  def remove_to_wishlist
    Wishlist.where(user_id: current_user.id, product_id: params[:product_id]).destroy_all
    redirect_to wishlists_path
  end
  def show
    @product = Product.find_by(id: params[:id])
  end
end

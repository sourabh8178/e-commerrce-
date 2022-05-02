class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def search 
    if params[:search].blank?
      redirect_to products_path
    else
     @products = Product.where(["LOWER(name) LIKE ?","%#{params[:search].downcase}%"])
    end
  end


  def add_to_cart
    if current_user.cart.present?
      @cart = current_user.cart
    else  
      @cart = Cart.create(user_id: current_user.id)
    end  
    @product = Product.find_by(id: params[:product_id])
    @cart.add(@product, @product.calculate_discount(@product))
    redirect_to carts_path
  end

  def remove_to_cart
    @cart = current_user.cart
    @product = Product.find_by(id: params[:product_id])
    @cart.remove(@product, 1)
    redirect_to carts_path
  end

  def cart_clear
    @cart = current_user.cart
    @cart.clear
    redirect_to carts_path
  end

  def add_to_wishlist
    @product = Product.find_by(id: params[:product_id])
    Wishlist.create(user_id: current_user.id, product_id: params[:product_id])
    redirect_to wishlists_path
  end

  def remove_to_wishlist
    Wishlist.where(user_id: current_user.id, product_id: params[:product_id]).destroy_all
    redirect_to request.referrer
  end
  def show
    @reviews = Review.all
    # @product = Product.find_by(id: params[:id])
    # @user = User.friendly.find(params[:id])
    # if Product.friendly.find(params[:id]).present?
    #   @product = Product.friendly.find(params[:id])
    # else
      @product = Product.find(params[:id])
    # end
  end

  def add_to_dolike
    @product = Product.find_by(id: params[:product_id])
    Dolike.create(user_id: current_user.id, product_id: params[:product_id])
    redirect_to request.referrer
  end

  def remove_to_dolike
    Dolike.where(user_id: current_user.id, product_id: params[:product_id]).destroy_all
    redirect_to request.referrer
  end

end

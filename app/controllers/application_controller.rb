class ApplicationController < ActionController::Base
	 before_action :authenticate_user!
	 protect_from_forgery prepend: true, with: :exception
	 # acts_as_shopping_cart_using :cart_product
	 # acts_as_shopping_cart_product_for :cart
end

class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :cart_item
  belongs_to :user

  def calculate_discount(product)
    discount_price = (product.price.to_f*product.discount.to_f)/100.0
    return (product.price.to_f - discount_price.to_f)
  end
  
end
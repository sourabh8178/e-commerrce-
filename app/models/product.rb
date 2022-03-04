class Product < ApplicationRecord 
	# extend FriendlyId
 #  	friendly_id :name, use: :slugged
  	
	has_many :order_items
	belongs_to :subcategory
	validates :name, presence: true
	mount_uploader :image, ImageUploader

	def calculate_discount(product)
		discount_price = (product.price.to_f*product.discount.to_f)/100.0
		return (product.price.to_f - discount_price.to_f)
	end
	
end

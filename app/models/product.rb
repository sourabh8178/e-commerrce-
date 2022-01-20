class Product < ApplicationRecord
	belongs_to :subcategory
	mount_uploader :image, ImageUploader

	def calculate_discount(product)
		discount_price = (product.price.to_f*product.discount.to_f)/100.0
		return (product.price.to_f - discount_price.to_f)
	end
end

class Review < ApplicationRecord
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :orders
	# belongs_to :product
end

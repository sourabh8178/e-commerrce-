class Category < ApplicationRecord
	has_many :subcategory, dependent: :destroy
	
end

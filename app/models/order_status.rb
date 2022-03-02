class OrderStatus < ApplicationRecord
	enum status: %i[created inprocess delivered cancelled]
end

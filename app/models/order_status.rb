class OrderStatus < ApplicationRecord
	enum status: %i[created inprocess deliverd cancelled]
	enum refund: %i[progress refunded failed NotApplicabel]
end

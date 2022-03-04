class OrderStatus < ApplicationRecord
	enum status: %i[created inprocess delivered cancelled]
	enum refund: %i[progress refunded failed NotApplicabel ]
end

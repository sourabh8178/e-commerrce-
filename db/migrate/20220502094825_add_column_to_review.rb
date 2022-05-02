class AddColumnToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :order_id, :integer
  end
end

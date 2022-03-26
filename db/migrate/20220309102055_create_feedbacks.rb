class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :body
      t.integer :rate

      t.timestamps
    end
  end
end

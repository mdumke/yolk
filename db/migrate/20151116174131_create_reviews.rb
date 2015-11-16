class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :body

      t.integer :user_id, index: true
      t.integer :farm_id, index: true

      t.timestamps null: false
    end
  end
end

class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :street
      t.integer :zip_code
      t.string :city
      t.string :country
      t.timestamps null: false
    end
  end
end

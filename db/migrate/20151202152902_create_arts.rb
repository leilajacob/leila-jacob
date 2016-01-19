class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.integer :category_id

      t.timestamps null: false
    end
  end
end

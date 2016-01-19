class CreateStorefronts < ActiveRecord::Migration
  def change
    create_table :storefronts do |t|
      t.string :all_art
      t.string :art_by_size

      t.timestamps null: false
    end
  end
end

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null:false
      t.string :image, null:false
      t.string :brand
      t.integer :condition
      t.integer :fee, null:false
      t.integer :area, null:false
      t.integer :shipping_days, null: false
    end
  end
end

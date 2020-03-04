class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building
    end
  end
end

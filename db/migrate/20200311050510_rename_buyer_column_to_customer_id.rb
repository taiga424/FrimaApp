class RenameBuyerColumnToCustomerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :buyer, :customer_id
  end
end

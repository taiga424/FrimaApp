class ChangeDataCustomerIdToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :customer_id, :string
  end
end

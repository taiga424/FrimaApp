class ChangeDataCustomerIdToItems < ActiveRecord::Migration[5.2]

  def up
    change_column :items, :customer_id, :string
  end

  def down
    change_column :items, :customer_id, :integer
  end
end

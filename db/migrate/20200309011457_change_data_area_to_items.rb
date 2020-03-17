class ChangeDataAreaToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :area, :string
  end
end

class RemoveColumnFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :completed, :boolean
  end
end

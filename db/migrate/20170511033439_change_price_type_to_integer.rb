class ChangePriceTypeToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :price, :integer, precision: 4, scale: 2
  end
end

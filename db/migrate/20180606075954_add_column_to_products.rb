class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :availability, :integer, default: 1
  end
end

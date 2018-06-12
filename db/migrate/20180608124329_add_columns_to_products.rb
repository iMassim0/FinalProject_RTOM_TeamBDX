class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :image, :string
    add_column :products, :description, :string
    add_column :products, :published, :boolean, default: false
    add_column :products, :size, :string
  end
end

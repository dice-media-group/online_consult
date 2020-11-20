class AddSkuToConsult < ActiveRecord::Migration[6.0]
  def change
    add_column :consults, :sku, :string
  end
end

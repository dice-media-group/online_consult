class AddTimeZoneToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :time_zone, :string
  end
end

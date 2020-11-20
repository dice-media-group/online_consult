class AddConnectThruToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :connect_thru, :string
  end
end

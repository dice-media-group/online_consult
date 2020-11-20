class AddConnectThruRefNumberToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :connect_thru_ref_number, :string
  end
end

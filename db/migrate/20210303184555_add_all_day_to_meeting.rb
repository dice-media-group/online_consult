class AddAllDayToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :all_day, :boolean
  end
end

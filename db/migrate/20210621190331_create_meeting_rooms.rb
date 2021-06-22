class CreateMeetingRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :meeting_rooms do |t|
      t.string :name
      t.text :schedule
      t.integer :capacity, default: 1

      t.timestamps
    end
  end
end

class AddGuestEmailToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :guest_email, :string
  end
end

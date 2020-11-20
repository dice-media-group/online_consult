class CreateConsults < ActiveRecord::Migration[6.0]
  def change
    create_table :consults do |t|
      t.string :title
      t.text :description
      t.integer :minutes_per_meeting
      t.string :token
      t.integer :meeting_limit
      t.string :contact_email

      t.timestamps
    end
  end
end

class RemoveDescriptionFromConsult < ActiveRecord::Migration[6.0]
  def change
    remove_column :consults, :description, :text
  end
end

class AddConsultReferenceToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :consult, null: false, foreign_key: true
  end
end

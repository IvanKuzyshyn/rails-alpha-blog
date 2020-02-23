class AddDatetineToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :created_at, :datetime
    add_column :contacts, :updated_at, :datetime
  end
end

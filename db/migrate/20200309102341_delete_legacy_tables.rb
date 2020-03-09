class DeleteLegacyTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :contacts
    drop_table :drafts
    drop_table :people
  end
end

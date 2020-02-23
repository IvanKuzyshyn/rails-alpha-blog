class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.text :title
      t.text :body
      t.string :recepient
      t.string :copy

      t.timestamps
    end
  end
end

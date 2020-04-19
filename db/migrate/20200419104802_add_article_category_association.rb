# frozen_string_literal: true

class AddArticleCategoryAssociation < ActiveRecord::Migration[6.0]
  def change
    create_table :article_category do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end

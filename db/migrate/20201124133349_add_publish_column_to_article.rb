class AddPublishColumnToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :is_published, :boolean, default: false
  end
end

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.text :content
      t.string :uid
    end
  end
end

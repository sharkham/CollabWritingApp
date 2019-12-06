class CreateSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :content
      t.text :summary
      t.string :tag
      t.belongs_to :novel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

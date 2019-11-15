class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.date :date
      t.boolean :status, default: false
      t.string :link
      t.references :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end

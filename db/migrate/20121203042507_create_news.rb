class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.integer :publisher_id
      t.datetime :published_at
      t.datetime :edited_at
      t.integer :edited_by_id

      t.timestamps
    end
  end
end

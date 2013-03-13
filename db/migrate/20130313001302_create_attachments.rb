class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :news_id
      t.string :display_name
      t.string :path
      t.string :file_type

      t.timestamps
    end
  end
end

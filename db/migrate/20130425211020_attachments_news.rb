class AttachmentsNews < ActiveRecord::Migration
  def up
    create_table :attachments_news do |t|
      t.integer :attachment_id
      t.integer :news_id
    end
  end

  def down
    drop_table :attachments_news
  end
end

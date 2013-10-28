class CreateCraigslistItems < ActiveRecord::Migration
  def change
    create_table :craigslist_items do |t|
      t.string :date
      t.string :contactName
      t.string :number
      t.text :textBody

      t.timestamps
    end
  end
end

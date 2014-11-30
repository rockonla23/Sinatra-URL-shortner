class CreateUrlsTable < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :url, null:false
      t.string :shorten_link
      t.integer :click_count, default: 0

      t.timestamps
    end
  end
end
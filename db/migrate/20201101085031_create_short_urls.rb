class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.text :full_url
      t.string :short_url
      t.text :title

      t.timestamps
    end
  end
end

class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text :url
      t.string :short_url
      t.string :ip_address

      t.timestamps
    end
    add_index :urls, :url, unique: true
    add_index :urls, :short_url, unique: true
  end
end

class CreateUrlShorts < ActiveRecord::Migration
  def change
    create_table :url_shorts do |t|
      t.string :short_url
      t.string :original_url
      t.string :short_token

      t.timestamps null: false
    end
  end
end

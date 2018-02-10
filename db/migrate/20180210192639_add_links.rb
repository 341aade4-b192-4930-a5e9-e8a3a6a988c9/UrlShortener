class AddLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :original_url, null: false
      t.string :short_url, null: false
      t.integer :all_clicks, null: false, default: 0

      t.timestamps null: false
    end

    add_index :links, :original_url
    add_index :links, :short_url, unique: true
  end
end

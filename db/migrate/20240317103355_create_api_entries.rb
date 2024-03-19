class CreateApiEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :api_entries do |t|
      t.string :api_name
      t.text :description
      t.string :auth
      t.boolean :https
      t.string :cors
      t.string :link
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

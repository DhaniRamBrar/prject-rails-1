class CreateFakerData < ActiveRecord::Migration[7.1]
  def change
    create_table :faker_data do |t|
      t.references :api_entry, null: false, foreign_key: true
      t.string :user_name
      t.string :user_email
      t.text :review

      t.timestamps
    end
  end
end

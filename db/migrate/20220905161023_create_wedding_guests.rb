class CreateWeddingGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :wedding_guests do |t|
      t.references :wedding, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

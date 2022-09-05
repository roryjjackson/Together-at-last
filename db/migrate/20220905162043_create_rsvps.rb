class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|
      t.references :wedding, null: false, foreign_key: true
      t.references :wedding_guests, null: false, foreign_key: true
      t.text :meal_choice
      t.text :spotify_song
      t.string :attendance
      t.string :attendee

      t.timestamps
    end
  end
end

class RemoveWeddingGuestsFromRsvp < ActiveRecord::Migration[7.0]
  def change
    remove_column :rsvps, :wedding_guests_id
  end
end

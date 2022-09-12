class AddCoordinatesToAccomodationInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :accomodation_infos, :latitude, :float
    add_column :accomodation_infos, :longitude, :float
  end
end

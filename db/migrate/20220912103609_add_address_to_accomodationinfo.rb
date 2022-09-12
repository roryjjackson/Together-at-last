class AddAddressToAccomodationinfo < ActiveRecord::Migration[7.0]
  def change
    add_column :accomodation_infos, :address, :string
  end
end

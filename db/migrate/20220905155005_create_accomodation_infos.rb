class CreateAccomodationInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :accomodation_infos do |t|
      t.string :url
      t.string :title
      t.text :description
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end

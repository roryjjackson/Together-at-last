class CreateVips < ActiveRecord::Migration[7.0]
  def change
    create_table :vips do |t|
      t.text :description
      t.string :name
      t.string :category
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end

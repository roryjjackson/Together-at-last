class CreateRegistries < ActiveRecord::Migration[7.0]
  def change
    create_table :registries do |t|
      t.string :item_name
      t.text :description
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRegistryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :registry_items do |t|
      t.references :registry, null: false, foreign_key: true
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end

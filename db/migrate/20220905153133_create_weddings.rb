class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings do |t|
      t.text :info
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.string :page_heading

      t.timestamps
    end
  end
end

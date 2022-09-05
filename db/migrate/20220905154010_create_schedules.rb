class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :time
      t.text :description
      t.references :wedding, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddHostToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :host, :boolean
  end
end

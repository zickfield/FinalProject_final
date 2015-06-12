class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :active

      t.timestamps null: false
    end
  end
end

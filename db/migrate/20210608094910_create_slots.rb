class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.references :user, null: false, foreign_key: true
      t.date :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end

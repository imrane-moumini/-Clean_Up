class ChangeTypeStartAndEndTimeToSlots < ActiveRecord::Migration[6.0]
  def change
    remove_column :slots, :start_time
    remove_column :slots, :end_time
    remove_column :slots, :day
    add_column :slots, :start_time, :datetime
    add_column :slots, :end_time, :datetime
  end
end

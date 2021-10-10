class ChangeDataStarttimeAndEndtimeToSchedule < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :start_time, :date
    change_column :schedules, :end_time, :date
  end
end

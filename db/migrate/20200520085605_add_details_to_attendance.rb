class AddDetailsToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :end_estimated_time, :datetime
    add_column :attendances, :next_day_flag, :boolean, default: false
    add_column :attendances, :business_outline：string, :string
    add_column :attendances, :application_status, :integer, default: 0
  end
end

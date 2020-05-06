class AddEmployeeNumberToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employee_number, :integer, comment:"ユーザーの社員番号"
    add_column :users, :uid, :string, comment:"ユーザーのカード番号"
    add_column :users, :designated_working_start, :datetime, default: Time.current.change(hour: 9, min: 0, sec: 0), comment:"ユーザーの指定勤務開始時間"
    add_column :users, :designated_work_end_time, :datetime, default: Time.current.change(hour: 18, min: 0, sec: 0), comment:"ユーザーの指定勤務終了時間"
    add_column :users, :superion, :boolean, default: false, comment:"上長かどうか"
  end
end

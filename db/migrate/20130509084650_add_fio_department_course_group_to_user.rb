class AddFioDepartmentCourseGroupToUser < ActiveRecord::Migration
  def change
    add_column :users, :fio, :string
    add_column :users, :course, :integer
    add_column :users, :group, :integer
    add_column :users, :department_id, :integer
  end
end

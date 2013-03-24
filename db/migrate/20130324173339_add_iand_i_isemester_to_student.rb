class AddIandIIsemesterToStudent < ActiveRecord::Migration
  def change
    add_column :students, :i_semester, :integer
    add_column :students, :ii_semester, :integer
  end
end

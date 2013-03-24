class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :first_semester_seminars_num
      t.integer :second_semester_seminars_num
      t.string :courses
      t.integer :groups
      t.string :title

      t.timestamps
    end
  end
end

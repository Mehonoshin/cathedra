class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :group_num
      t.integer :department_id
      t.string :name
      t.integer :course
      t.string :first_sem_seminars
      t.string :second_sem_seminars
      t.integer :illness_history
      t.integer :before_rate
      t.integer :exam_test
      t.integer :exam_practice
      t.integer :exam_theory
      t.integer :rate_after
      t.integer :common_rate

      t.timestamps
    end
  end
end

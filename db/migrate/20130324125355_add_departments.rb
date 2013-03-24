# coding: utf-8
class AddDepartments < ActiveRecord::Migration
  def up
    Department.create!(title: "Лечебный", courses: [3], first_semester_seminars_num: 20, second_semester_seminars_num: 17, groups: 26)
    Department.create!(title: "Медико-профилактический", courses: [3], first_semester_seminars_num: 19, second_semester_seminars_num: 8, groups: 3)
    Department.create!(title: "Педиатрический", courses: [3], first_semester_seminars_num: 20, second_semester_seminars_num: 17, groups: 12)
    Department.create!(title: "Стоматологический", courses: [2,3], first_semester_seminars_num: 10, second_semester_seminars_num: 8, groups: 12)
  end

  def down
  end
end

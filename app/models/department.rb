class Department < ActiveRecord::Base
  attr_accessible :courses, :first_semester_seminars_num, :groups, :second_semester_seminars_num, :title
  has_many :students
  serialize :courses, Array
end

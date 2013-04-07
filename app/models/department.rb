class Department < ActiveRecord::Base
  attr_accessible :courses, :first_semester_seminars_num, :groups, :second_semester_seminars_num, :title, :seminar_themes
  has_many :students
  serialize :courses, Array
  serialize :seminar_themes, Hash
end

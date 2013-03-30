class Student < ActiveRecord::Base
  attr_accessible :before_rate, :common_rate, :course, :department_id,
    :exam_practice, :exam_test, :exam_theory, :first_sem_seminars,
    :group_num, :illness_history, :name, :rate_after, :second_sem_seminars,
    :i_semester, :ii_semester
  belongs_to :department

  serialize :first_sem_seminars, Array
  serialize :second_sem_seminars, Array

  before_save :set_rate_after
  before_save :set_before_rate
  before_save :set_common_rate

  def i_semester_result
    i_semester
  end

  def ii_semester_result
    ii_semester
  end

  private

    def koeff
      1.0 / (department.first_semester_seminars_num + department.second_semester_seminars_num + 5)
    end

    def set_rate_after
      if exam_test? && exam_practice? && exam_theory?
        self.rate_after = (exam_test*0.1 + exam_practice*0.2 + exam_theory*0.7) * 10
      end
    end

    def set_before_rate
      sum = 0
      first_sem_seminars.each do |sem|
        sum += sem.to_i * koeff
      end
      second_sem_seminars.each do |sem|
        sum += sem.to_i * koeff
      end
      sum += i_semester * 2 * koeff if i_semester?
      sum += ii_semester * 2 * koeff if ii_semester?
      sum += illness_history * koeff if illness_history?
      self.before_rate = sum * 10
    end

    def set_common_rate
      self.common_rate = before_rate * 0.4 + rate_after * 0.6 if before_rate? && rate_after?
    end

end

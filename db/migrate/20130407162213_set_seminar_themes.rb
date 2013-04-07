class SetSeminarThemes < ActiveRecord::Migration
  def up
    Department.all.each do |department|
      seminar_themes = {
        "I" => {},
        "II" => {},
      }
      1.upto(department.first_semester_seminars_num) { |i| seminar_themes["I"][i] = "Theme #{i}" }
      1.upto(department.second_semester_seminars_num) { |i| seminar_themes["II"][i] = "Theme #{i}" }
      department.update_attributes(seminar_themes: seminar_themes)
    end
  end

  def down
  end
end

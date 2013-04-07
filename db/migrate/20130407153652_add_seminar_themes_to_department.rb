class AddSeminarThemesToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :seminar_themes, :text
  end
end

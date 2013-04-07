# coding: utf-8
module StudentsHelper
  def groups_list
    groups = {}
    Department.all.each do |dept|
      groups[dept.title] = {}
      dept.courses.each do |course|
        groups[dept.title][course] = []
        1.upto(dept.groups) do |num|
          groups[dept.title][course] << [group_name(dept, course, num), num]
        end
        groups[dept.title][course] = options_for_select(groups[dept.title][course])
      end
    end
    groups
  end

  def group_name(dept, course, num)
    dept.title[0..0] + '-' + course.to_s + format_num(num).to_s
  end

  def format_num(num)
    if num < 10
      "0#{num}"
    else
      num
    end
  end

  def mark_box(value, limit, n_required)
    if can? :manage, Student
      marks = [["", ""]]
      marks << ["Н", 0] if n_required
      1.upto(limit) { |i| marks << [i, i] }
      select_tag :mark, options_for_select(marks, value), class: "mark-select"
    else
      value
    end
  end
end

module StudentsHelper
  def groups_list
    groups = []
    Department.all.each do |dept|
      1.upto(dept.groups) do |num|
        dept.courses.each do |course|
          groups << ["#{dept.title[0..0]}-#{course}#{num}", num]
        end
      end
    end
    groups
  end

  def mark_box(value, limit, n_required)
    marks = [["", ""]]
    marks << ["H", 0] if n_required
    1.upto(limit) { |i| marks << [i, i] }
    select_tag :mark, options_for_select(marks, value), class: "mark-select"
  end
end

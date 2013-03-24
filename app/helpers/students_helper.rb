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
end

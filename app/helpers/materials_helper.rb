module MaterialsHelper
  def map_faculties(category)
    if category == "stud_society"
      []
    else
      Material::FACULTIES
    end
  end
end

module ArticlesHelper
  def russian_date(date)
    date.strftime('%d.%m.%Y')
  end
end

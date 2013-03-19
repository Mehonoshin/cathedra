# coding: utf-8
module ArticlesHelper
  def russian_date(date)
    date.strftime('%d.%m.%Y в %H:%M')
  end
end

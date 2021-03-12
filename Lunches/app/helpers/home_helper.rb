module HomeHelper
  # Проверяем, является ли день выходным(Сб, Вск)
  def on_weekday?(date)
    date.wday == 6 || date.wday.zero?
  end
end

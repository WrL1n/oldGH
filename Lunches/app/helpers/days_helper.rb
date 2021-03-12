module DaysHelper
  # Не уверен, что им тут место, но еще не знаю куда их перенести (мб в контроллер ?)

  # Проверяем,что не существует заказ на этот день от данного юзера
  # в view/days/show:
  # if true - показываем форму создания нового заказа
  # else - показать уже созданный заказ
  def order_does_not_exists?(id, date)
    (Order.find_by user_id: id, day_date: date).nil?
  end

  # Получаем массив объектов класса Product
  # находящихся в меню с указаной позицией
  def products_in_menu_with_position(pos)
    Product.where(in_menu: true, position: pos)
  end

  # Получаем объект класса Order
  # находим продукты, находящиеся в этом заказе
  # и  сортируем их
  def products_in_order(order)
    Product.where(id: [order.first_pos, order.second_pos, order.third_pos]).order(position: :asc)
  end

  def product_in_order(id)
    if id != nil
      Product.find(id).title
    else
      ''
    end
  end

  def show_username(id)
    User.find(id).username
  end

  # Получаем массив объектов класса User и дату дня
  # отдаем массив(объектов класса Order) today заказов для этого юзера
  def user_order(user, date)
    user.orders.where(day_date: date)
  end

  # def daily_total_price_for_organisation(organisation)
  #   organisation.users.orders.sum(:price)
  # end

  def daily_total_price_for_organisation(date, organisation)
    Order.where(day_date: date, user_id: [organisation.users.ids]).sum(:price)
  end

  def daily_total_price(date)
    Order.where(day_date: date).sum(:price)
  end

  def full_order?(order)
    if order.first_pos.nil? || order.second_pos.nil? || order.third_pos.nil?
      false
    else
      true
    end
  end
end

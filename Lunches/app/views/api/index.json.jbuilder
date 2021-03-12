json.date @day.date

json.orders @day.orders do |order|
  json.organisation organisation_name(order.user_id)
  json.username user_name(order.user_id)
  json.product name_product(order.first_pos) << ', ' << name_product(order.second_pos) << ', ' << name_product(order.third_pos)
end

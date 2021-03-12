FactoryBot.define do
  factory :day do
    sequence(:date) { |n| (Time.zone.now + n.day).to_datetime.strftime("%Y-%m-%d") }

    trait(:today) { date Time.zone.now .to_datetime.strftime("%Y-%m-%d") }

    # Создание дня с 4 заказами
    factory :day_with_orders do
      transient do
        orders_count 4
      end

      after(:create) do |day, evaluator|
        create_list(:order, evaluator.orders_count, day: day)
      end
    end
  end
end

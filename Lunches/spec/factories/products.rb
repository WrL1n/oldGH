FactoryBot.define do
  factory :product do
    # title "Lorem ipsum hot"
    # description "Lorem ipsum dolor sit amet"
    # price 10
    # position 1
    # in_menu true
    # path_to_image "MyString"

    sequence(:title) { |n| "Lorem ipsum hot #{n}" }
    sequence(:description) { |n| "Lorem ipsum dolor sit amet #{n}" }
    sequence(:price) { |n| rand(1..20.1) + n }
    sequence(:position) { rand(1..3) }
    sequence(:in_menu) { rand(0..1) }

    trait(:pos_1) { position 1 }
    trait(:pos_2) { position 2 }
    trait(:pos_3) { position 3 }
    trait(:in_menu) { in_menu true }
    trait(:not_in_menu) { in_menu false }

    # association :menu
    # association :menu, :in_menu

    # используется в создании menu
    factory :product_in_menu do
      in_menu true

      association :menu
    end
  end
end

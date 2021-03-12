FactoryBot.define do
  factory :organisation do
    # name "MyOrganisation"
    # email "Hello@world.com"
    # description "MyText MyTest MyPeppa"
    # path_to_image "/MyString"

    sequence(:name) { |n| "MyOrganisation#{n}" }
    sequence(:email) { |n| "Hello#{n}@world.com" }
    sequence(:description) { |n| "MyText MyTest MyPeppa #{n}" }

    # Создание организации с 3 юзерами
    factory :organisation_with_users do
      transient do
        users_count 3
      end

      after(:create) do |organisation, evaluator|
        create_list(:user, evaluator.users_count, organisation: organisation)
      end
    end
  end
end

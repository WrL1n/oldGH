# This will guess the User class
FactoryBot.define do
  factory :user do
    # username "Terminator"
    # email "I.Terminator@save.world"
    # password "JohnConnor"

    sequence(:username) { |n| "Terminator#{n}" }
    sequence(:email) { |n| "I.Terminator#{n}@save.world" }
    sequence(:password) { |n| "JohnConnor#{n}" }

    first_name "Arnold"
    last_name "Schwarzenegger"
    admin false

    organisation
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    username "Bobik"
    email "Bobik@not.cat"
    password "gavgav"
    first_name "Sir"
    last_name "Jr."
    admin true

    organisation
  end
end

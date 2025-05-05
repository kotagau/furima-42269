FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {Faker::Internet.email}
    password {"poke6604956"}
    password_confirmation {"poke6604956"}
    family_name{"我有"}
    family_name_read{"航汰"}
    given_name{"ガウ"}
    given_name_read{"コウタ"}
    date_of_birth{1998-11-9}
  end

end


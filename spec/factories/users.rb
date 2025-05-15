FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.email }
    password { 'poke6604956' }
    password_confirmation { 'poke6604956' }
    family_name { '空野空野' }
    family_name_read { '太郎' }
    given_name { 'ソラノ' }
    given_name_read { 'タロウ' }
    date_of_birth { Faker::Date.birthday }
  end
end

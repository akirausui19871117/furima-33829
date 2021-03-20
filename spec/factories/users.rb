FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 6) }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 7) }
    password_confirmation  { password }
    family_name            { "あ" }
    first_name             { "あ" }
    family_name_kana       { "ア" }
    first_name_kana        { "ア"}
    birthday               { "1987-11-17" }
  end
end
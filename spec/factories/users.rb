FactoryBot.define do
  factory :user do
    nickname               { "test" }
    email                  { "test@example" }
    password               { "111aaaa" }
    password_confirmation  { password }
    family_name            { "あ" }
    first_name             { "あ" }
    family_name_kana       { "ア" }
    first_name_kana        { "ア"}
    birthday               { "1987-11-17" }
  end
end
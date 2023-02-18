FactoryBot.define do
  factory :user do
    nickname              {'haruki'}
    email                 {'haruki@51'}
    password              {'haruki51'}
    password_confirmation {password}
    last_name             {'中山'}
    first_name            {'陽喜'}
    last_name_kana        {'ナカヤマ'}
    first_name_kana       {'ハルキ'}
    birth_date            {'1930-01-01'}
  end
end
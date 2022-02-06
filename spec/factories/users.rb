FactoryBot.define do
  factory :user do
    nickname              {'testfurima太郎'}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'仮山田'}
    first_name            {'仮陸太郎'}
    last_name_kana        {'カリヤマダ'}
    first_name_kana       {'カリリクタロウ'}
    birth_day             {'1930-01-01'}
  end
end

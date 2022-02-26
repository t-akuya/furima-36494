FactoryBot.define do
  factory :item do
    association :user
    name                {'テストてすとtest'}
    text                {'テキストテストてきすとてすとtexttest'}
    category_id         {Faker::Number.between(from: 2, to: 11)}
    condition_id        {Faker::Number.between(from: 2, to: 8)}
    delivery_id         {Faker::Number.between(from: 2, to: 3)}
    prefecture_id       {Faker::Number.between(from: 2, to: 48)}
    shipment_days_id    {Faker::Number.between(from: 2, to: 4)}
    price               {Faker::Number.between(from: 300, to: 9999999)}
  end
end

FactoryBot.define do
  factory :cryptocurrency do
    sequence(:symbol) { |n| "BTC#{n}" }
    sequence(:price) { |n| 100 * n }
  end
end

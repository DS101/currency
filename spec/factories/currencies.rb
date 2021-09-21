FactoryBot.define do
  factory :currency do
    name { 'US Dollar' }
    code { 'USD' }
    value { '75,000' }
  end
end

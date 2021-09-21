# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

currencies = [
  { code: 'USD', name: 'US Dollar', value: '73,000' },
  { code: 'EUR', name: 'Euro', value: '83,000' }
]

currencies.each do |currency|
  Currency.create!(currency)
end

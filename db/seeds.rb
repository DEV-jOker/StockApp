# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..7).each do |n|
  User.create(name:"test#{n}",email:"test#{n}@gmail.com",password:"123456")
end
puts "Users created"

symbols = ["Z","MSFT","GOOG","AMZN","ZULU","ZNGA","ZM","XP","WORK"]
symbols.each do |symbol|
  user = User.find_by(email:"test#{rand(1..7)}@gmail.com")
  stock = Stock.get_stock(symbol)
  stock.save!
  user.stocks << stock
end
puts "Stocks added to users"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

# Let's create some groups
food = ActionGroup.create!(name: "Food")
drink = ActionGroup.create!(name: "Drink")

food.action_items << ActionItem.new(name:"Pizza")
food.action_items << ActionItem.new(name:"Rice")
food.action_items << ActionItem.new(name:"Pasta")
food.action_items << ActionItem.new(name:"Soup")
food.action_items << ActionItem.new(name:"Burger")
food.action_items << ActionItem.new(name:"Fries")
food.action_items << ActionItem.new(name:"Vegetable")
food.action_items << ActionItem.new(name:"Fruit")

drink.action_items << ActionItem.new(name:"Red Wine")
drink.action_items << ActionItem.new(name:"White Wine")
drink.action_items << ActionItem.new(name:"Coffee")
drink.action_items << ActionItem.new(name:"Tea")
drink.action_items << ActionItem.new(name:"Hot Chocoloate")
drink.action_items << ActionItem.new(name:"Juice")
drink.action_items << ActionItem.new(name:"Water")
drink.action_items << ActionItem.new(name:"Beer")
drink.action_items << ActionItem.new(name:"Champagne")
drink.action_items << ActionItem.new(name:"Strong alcohol")
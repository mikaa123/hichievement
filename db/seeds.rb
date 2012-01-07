# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

# ActionGroup has a DSL to create and manage groups of items.

ActionGroup.add_group "Food", "What did you eat?" do
  with_actions %w[Pizza Rice Pasta Soup Burger Fries Vegetable Fruit]
end

ActionGroup.add_group "Drink", "What did you drink today?" do
  with_actions [ "Red Wine", "White Wine", "Coffee", "Tea", "Hot Chocoloate",
                 "Juice", "Water", "Beer", "Champagne", "Strong alcohol" ]
end

ActionGroup.add_group "Sport", "Which sport did you do today?" do
  with_actions %w[Foot
                  basket
                  tennis pingpong badminton
                  volley
                  hand
                  athletisme
                  natation
                  cyclisme
                  roller skate bmx]
end

ActionGroup.add_group "Hygiene", "Hope you did one of these:" do
  with_actions [ "Shower", "Bath", "Brush my teeth" ]
end

ActionGroup.add_group "Classic", "No idea for the description yet" do
  with_actions %w[Lire
                  Regarder la tv
                  Cinema
                  Theatre
                  TrainerSurInternet
                  JeuxVideos
                  JouerMusique
                  jeuxDeSociete
                  trainerDehorsAvecDesGens
                  Telephone
                  Resto]
end

ActionGroup.add_group "Muscle", "flex" do
  with_actions [ "pompes",
                 "abdos",
                 "alteres" ,
                 "trucs ou on se hisse a la barre",
                 "yogging" ]
end

# Let's create some groups
# food = ActionGroup.create!(name: "Food", desc: "What did you eat?")
# drink = ActionGroup.create!(name: "Drink", desc: "What did you drink?")

# food.action_items << ActionItem.new(name:"Pizza")
# food.action_items << ActionItem.new(name:"Rice")
# food.action_items << ActionItem.new(name:"Pasta")
# food.action_items << ActionItem.new(name:"Soup")
# food.action_items << ActionItem.new(name:"Burger")
# food.action_items << ActionItem.new(name:"Fries")
# food.action_items << ActionItem.new(name:"Vegetable")
# food.action_items << ActionItem.new(name:"Fruit")

# drink.action_items << ActionItem.new(name:"Red Wine")
# drink.action_items << ActionItem.new(name:"White Wine")
# drink.action_items << ActionItem.new(name:"Coffee")
# drink.action_items << ActionItem.new(name:"Tea")
# drink.action_items << ActionItem.new(name:"Hot Chocoloate")
# drink.action_items << ActionItem.new(name:"Juice")
# drink.action_items << ActionItem.new(name:"Water")
# drink.action_items << ActionItem.new(name:"Beer")
# drink.action_items << ActionItem.new(name:"Champagne")
# drink.action_items << ActionItem.new(name:"Strong alcohol")
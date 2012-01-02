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
daily = ActionGroup.create!(name: "Daily")
sport = ActionGroup.create!(name: "Sport")
healthy = ActionGroup.create!(name: "Healthy")
intel = ActionGroup.create!(name: "Intellectual")

ActionItem.create!(name:"manger").action_groups << daily
ActionItem.create!(name:"faire caca").action_groups << daily
ActionItem.create!(name:"dormir").action_groups << daily

ActionItem.create!(name:"niquer").action_groups << healthy

ActionItem.create!(name:"read").action_groups << intel

ActionItem.create!(name:"jogging").action_groups << sport

ActionItem.create!(name:"didn't smoke").action_groups << healthy
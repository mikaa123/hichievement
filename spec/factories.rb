# Contains all the factories for Factory Girl

# FactoryGirl generates dynamically valid records
# for the database.
FactoryGirl.define do
  sequence(:username) { |n| "user-#{n}" }
  sequence(:uid) { |n| n }
  sequence(:groupe_name) { |n| "groupe-#{n}" }

  # Putting things between brackets makes it lazy. It'll be
  # evaluated later on
  factory :user do
    uid       { Factory.next :uid }
    name      { Factory.next :username }
    email     'some@email.com'
    provider  'twitter'
  end

  factory :action_item do
    name	"bliblablou"
  end

  factory :perfored_action do
  end
  
  factory :action_group do
    name      { Factory.next :groupe_name }
  end
end

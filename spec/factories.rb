# Contains all the factories for Factory Girl

# FactoryGirl generates dynamically valid records
# for the database.
FactoryGirl.define do
  sequence(:username) { |n| "user-#{n}" }
  sequence(:uid) { |n| n }

  # Putting things between brackets makes it lazy. It'll be
  # evaluated later on
  factory :user do
    uid       { Factory.next :uid }
    name      { Factory.next :username }
    email     'some@email.com'
    provider  'twitter'
  end
end

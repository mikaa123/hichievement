Given /^I am logged$/ do
  visit '/'
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:twitter, {
                           :provider => 'twitter',
                           :uid => '12345',
                           :user_info => {
                             :name => 'foo'
                           }
                           })
  click_link('Login')
  body.should include('Logout')
end

When /^there is an Eating action available$/ do
  ActionItem.create!(name: "Eat")
end

When /^I select an Eating action$/ do
  visit '/dashboard'
  click_button('Eat')
end

Then /^it should be registered$/ do
  body.should include('Eat')
end
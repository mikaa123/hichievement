Given /^I am not logged$/ do
  visit '/'
  body.should include('Login')
end

When /^I click on login$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
  click_link('Login')
end

When /^I enter wrong information$/ do
end

Then /^I shouldn't be logged$/ do
  body.should include('Login')
end

When /^I enter valid credentials$/ do
  OmniAuth.config.test_mode = true
  OmniAuth.config.add_mock(:twitter, {
                           :provider => 'twitter',
                           :uid => '12345',
                           :user_info => {
                             :name => 'foo'
                           }
                           })
  click_link('Login')
end

Then /^I should be logged$/ do
  body.should include('Logout')
end

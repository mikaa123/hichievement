Given /^I am not logged$/ do
  visit '/'
  # page.should have_text('Login')
end

When /^I click on login$/ do
  click_link('Login')
end

When /^I enter wrong information$/ do
  save_and_open_page
end

Then /^I shouldn't be logged$/ do
  visit '/'
end

Given(/^some races in the collection$/) do
  
end

When(/^I visit the list of races$/) do
  visit '/races'
end

When(/^I visit the homepage$/) do
  visit '/'
end

Then(/^I see all races$/) do
  page.should have_content 'London Marathon'
  page.should_not have_content 'Edit'
  page.should_not have_content 'Destroy'
  page.should_not have_content 'New user'
end
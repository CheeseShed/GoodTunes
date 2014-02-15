Given(/^some races in the collection$/) do
  
end

When(/^I visit the list of races$/) do
  visit ui_url '/races'
end

Then(/^I see all races$/) do
  page.should have_content 'London Marathon'
  page.should_not have_content 'Edit'
  page.should_not have_content 'Destroy'
end
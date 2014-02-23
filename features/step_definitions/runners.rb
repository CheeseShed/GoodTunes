Given(/^some runners in the collection$/) do

end

When(/^I visit the list of runners$/) do
  visit '/runners'
end

Then(/^I see all runners$/) do
  page.should have_content 'Karen Amgfidaiihhg Baoescu'
  page.should have_content 'Dorothy Amggfiaidjga Schrockmanescubergsonsteinsenwitzsky'
  page.should_not have_content 'Edit'
  page.should_not have_content 'Destroy'
  page.should_not have_content 'New user'
end
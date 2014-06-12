#Given(/^I am on the YouTube home page$/) do
#  visit 'http://www.youtube.com'
#end
#
#When(/^I search for "(.*?)"$/) do |search_term|
#  fill_in 'search_query', :with => search_term
#  click_on 'search-btn'
#end
#
#Then(/^videos of Animal Planet are returned$/) do
#  page.should have_content 'Animal Planet'
#end
World(Rack::Test::Methods)


Given(/^I open new product site$/) do
  visit('/products/new')
end
When(/^I input new product$/) do
  fill_in 'Name', :with => 'Matt'
  fill_in 'Description', :with => 'Catch 22'
  select 'Meat', :from => 'Sub category'
  click_on 'Create Product'
end
Then(/^I should see the product created confirmed$/) do
  page.should have_text 'hello world'
end
Given('I am authenticated') do
	u = User.create!(:email=>"easyhome0102@gmail.com",
	:password => "easyhome.0102",
	:roles_mask => 0 )
	visit "/"
	fill_in "Email", with: "easyhome0102@gmail.com"
	fill_in "Password", with: "easyhome.0102"
	click_button "Log in"
end

Given('I am on app homepage') do
    visit 'ads' 
    #pending # Write code here that turns the phrase above into concrete actions
end

When('I follow {string}') do |string|
	click_link(string)
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be on the Create New Ad Page') do
    current_path = URI.parse(current_url).path
    current_path == '/ads/new'
    #pending # Write code here that turns the phrase above into concrete actions
end

When('I fill in {string} with {string}') do |field, value|
	fill_in(field, :with => value)
    #pending # Write code here that turns the phrase above into concrete actions
end

When('I press {string}') do |string|
    click_button(string)
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be on the app homepage') do
    current_path = URI.parse(current_url).path
    current_path == '/ads'
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see {string}') do |string|
    expect(page).to have_content(string)
    #pending # Write code here that turns the phrase above into concrete actions
end

Given('I am on edilnews page') do
    visit 'articles' 
    #pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Article "(.*?)" with Autore articolo "(.*?)" is there$/) do |arg1,arg2|
  a = Article.new( title: arg1, author: arg2)
  a.save
end

When(/^I click on "(.*?)" for Article "(.*?)" with Autore articolo "(.*?)"$/) do |arg1,arg2,arg3|
	a = Article.find_by( title: arg2, author: arg3)
    a.save
	visit 'articles'
    click_link(arg1)
end

Then(/^I should see "(.*?)" for Article "(.*?)" with Autore articolo "(.*?)"$/) do |arg1,arg2,arg3|
	a = Article.find_by( title: arg2, author: arg3)
    a.save
	current_path = URI.parse(current_url).path
    current_path == '/articles/show'
end 

When(/^I click link "(.*?)" for Article "(.*?)" with Autore "(.*?)"$/) do |arg1,arg2,arg3|
	a = Article.find_by( title: arg2, author: arg3)
    a.save
    click_link(arg1)
end

Then('I should be on the edilnews page') do
    current_path = URI.parse(current_url).path
    current_path == '/articles'
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should not see Article {string}') do |string|
    expect(page).to have_no_content(string)
    #pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Ad "(.*?)" with Descrizione: "(.*?)" is there$/) do |arg1,arg2|
  a = Ad.new( title: arg1, notice: arg2)
  a.save
end

When(/^I click on "(.*?)" for Ad "(.*?) with Descrizione: "(.*?)"$/) do |arg1,arg2,arg3|
	a = Ad.find_by( title: arg2, notice: arg3)
    a.save
	visit 'ads'
    click_link(arg1)
end

Then(/^I should see "(.*?)" for Ad "(.*?)" with Descrizione: "(.*?)"$/) do |arg1,arg2,arg3|
	a = Ad.find_by_title( title: arg2, notice: arg3)
	current_path = URI.parse(current_url).path
    current_path == '/ads/show'
end 

When(/^I click link "(.*?)" for Ad "(.*?)" with Descrizione: "(.*?)"$/) do |arg1,arg2,arg3|
	a = Ad.new( title: arg2, notice: arg3)
	a.save
	visit 'ads/show'
    click_link(arg1)
end

Given('I am on my profile') do
    visit '/' 
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should be on my profile') do
    current_path = URI.parse(current_url).path
    current_path == '/users'
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see the favorites list') do
  	current_path = URI.parse(current_url).path
    current_path == '/users/show'
  #pending # Write code here that turns the phrase above into concrete actions
end

When /^I follow image link "([^"]*)"$/ do |img_alt|
    find(:xpath, "//img[@alt = '#{img_alt}']/parent::a").click()
end


Then('I should see the like of the articles') do
  	current_path = URI.parse(current_url).path
    current_path == '/users/show'
  #pending # Write code here that turns the phrase above into concrete actions
end

Given('I am on article page') do
	visit 'articles#show'
end

When('I write a comment {string}') do |string|
  c = Comment.new(body: string)
  c.save
  #pending # Write code here that turns the phrase above into concrete actions
end

When('I press button {string}') do |string|
   visit 'articles#show'
   click_link(string)
    #pending # Write code here that turns the phrase above into concrete actions
end

Then('I should see comment {string} in the article page') do |string|
  current_path = URI.parse(current_url).path
  current_path == '/articles/show'
  #pending # Write code here that turns the phrase above into concrete actions
end


  

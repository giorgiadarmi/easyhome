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
    assert page.has_content?(string)
    #pending # Write code here that turns the phrase above into concrete actions
end
  
  
  
  
  
  

  
  
  

  

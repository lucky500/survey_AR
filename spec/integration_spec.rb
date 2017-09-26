require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a survey' do
    visit '/'
    fill_in('title', :with => 'Survey_10')
    click_button('Add Survey')
    expect(page).to have_content('Your survey has been created !!')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the survey' do
    test_survey = Survey.new({:title => 'Rfsfddsf', :id => nil})
    test_survey.save
    visit '/'
    click_link('Rfsfddsf')
    click_link('Edit Survey')
    fill_in('title', :with => 'Brand New Survey')
    click_button('Update')
    expect(page).to have_content('Brand New Survey')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a survey' do
    test_survey = Survey.new({:title => 'New Survey', :id => nil})
    test_survey.save
    id = test_survey.id
    visit "/#{id}/edit"
    click_button('Delete Survey')
    visit "/"
    expect(page).not_to have_content("New Survey")
  end
end

# describe 'the question detail page path', {:type => :feature} do
#   it 'shows a question detail page' do
#     test_survey = Survey.new({:title => 'New Survey', :id => nil})
#     test_survey.save
#     survey_id = id = test_survey.id
#     project_id = test_project.id.to_i
#     test_volunteer = Volunteer.new({:name => 'Jasmine', :project_id => project_id, :id => nil})
#     test_volunteer.save
#     visit "/projects/#{project_id}"
#     click_link('Jasmine')
#     fill_in('name', :with => 'Jane')
#     click_button('Update Volunteer')
#     expect(page).to have_content('Jane')
#   end

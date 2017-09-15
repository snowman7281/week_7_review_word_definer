require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Words List', {:type => :feature}) do
  it "saves a new word and shows in list" do
    visit('/')
    fill_in('word', :with => "Apple")
    click_button("Add")
    expect(page).to have_content("Apple")
  end
end

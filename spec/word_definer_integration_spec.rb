require './app'
require 'capybara/rspec'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Kids Words and Definitions List', {:type => :feature}) do
  it "saves a new word and shows in list" do
    visit('/')
    fill_in('word-input', :with => "Apple")
    click_button("Add")
    expect(page).to have_content("Apple")
  end

  it "shows error message when user adds word that already exists" do
      visit('/')
      fill_in('word-input', :with => "Apple")
      click_button("Add")
      expect(page).to have_content("Apple is already defined in the list. Please enter another word.")
    end

  # it "does not add blank phone/email/addresses to contact" do
  #   visit('/')
  #   click_link('Apple')
  #   click_button('Edit')
  #   click_button('Update')
  #   expect(page).to have_no_content('Default:')
  # end

  it "allows user to add multiple phone/email/address entries" do
    visit('/')
    click_link('Apple')
    click_button('Edit')
    fill_in('definition-input-1', :with => "Red Fruit")
    fill_in('author-input-1', :with => "Snowman")
    click_button('Update')
    expect(page).to have_content("Definition: Red Fruit")
    expect(page).to have_content("Author: Snowman")
  end

  it "allows user to delete words" do
    visit('/')
    click_link('Apple')
    click_button('Delete')
    expect(page).to have_content("Apple has been deleted.")
    click_link("Back to Words List")
    expect(page).to have_no_content('Apple')
  end

end

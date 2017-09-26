require 'capybara/rspec'
require './app'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Kids can click on a link to add new words', {:type => :feature}) do
  it('Kids can add a new word to the list') do
    visit('/')
    click_link('Add a new word')
    expect(page).to have_content('Enter a word!')
  end

  it('kids can enter a word') do
    visit('/words/new')
    fill_in('word', :with => 'hello')
    click_button('Add Word')
    expect(page).to have_content('Word is now added!')
  end

  it('kids can see the word they entered') do
    visit('/words')
    expect(page).to have_content('hello')
  end

  it('kids can click a link to add a definition') do
    visit('/words')
    click_link('hello')
    expect(page).to have_content('Add Definition')
  end

end

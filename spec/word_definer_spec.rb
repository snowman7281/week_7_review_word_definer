require 'pry'
require 'rspec'
require 'word_definer'

describe('WordsLis::Words') do
  before()do
    WordsList::Words.clear_all
  end

  # it "stores a word into a list" do
  #   apple = WordsList::Words.new({:words => "Apple"})
  #   expect(apple.words).to(eq("Apple"))
  # end

  it "stores a word and definition into a list" do
    apple = WordsList::Words.new({})
    apple.add_word("Red Fruit", "Apple")
    expect(apple.words).to(eq({ "Apple" => "Red Fruit"}))
  end

  it "provides list of all words objects" do
    expect(WordsList::Words.all).to(eq({}))
  end

  it "allows user to save a contact to view later" do
    apple = WordsList::Words.new({})
    apple.add_word("Red Fruit", "Apple")
    apple.save
    expect(apple.words).to(eq({ "Apple" => "Red Fruit"}))
  end

  it "does not allow a user to save a new word that already exist in the list" do
    apple = WordsList::Words.new({})
    apple.add_word("Red Fruit", "Apple")
    apple.save
    apple = WordsList::Words.new({})
    apple.add_word("Red Fruit", "Apple")
    expect(apple.save).to(eq("That word is already defined in the list."))
  end

end

require 'pry'
require 'rspec'
require 'word_definer'

describe('WordsLis::Words') do
  before()do
    WordsList::Words.clear_all
  end

  it "stores a word into a list" do
    apple = WordsList::Words.new({:words => "Apple"})
    expect(apple.words).to(eq("Apple"))
  end

  it "stores a word and definition into a list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.add_word("Apple")
    expect(apple.words).to(eq( "Apple"))
  end

  it "provides list of all words objects" do
    expect(WordsList::Words.all).to(eq({}))
  end

  it "allows user to save a word to view later" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.save
    expect(apple.words).to(eq( "Apple"))
  end

  it "does not allow a user to save a new word that already exist in the list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.save
    apple = WordsList::Words.new({:words => "Apple"})
    expect(apple.save).to(eq("Apple is already defined in the list. Please enter another word."))
  end

  it "can find a word" do
    apple = WordsList::Words.new({:words => "Apple"})
    banana = WordsList::Words.new({:words => "Banana"})
    banana.save
    expect(WordsList::Words.find("Banana")).to(eq(banana))
  end

end

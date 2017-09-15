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

  it "stores definition to the word on the list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.add_definitions("Red Fruit", "Snowman")
    expect(apple.definitions).to(eq({"Snowman" => "Red Fruit"}))
  end

  it "stores definition to the word on the list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.add_definitions("Red Fruit", "Snowman")
    apple.add_definitions("Crunch", "King of the North")
    expect(apple.definitions).to(eq({"Snowman" => "Red Fruit", "King of the North" => "Crunch"}))
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

  it "returns an error when contact is not saved" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.save
    banana = WordsList::Words.new({:words => "Banana"})
    expect(WordsList::Words.find("Banana")).to(eq("Sorry can not find word"))
  end

  it "can clear words list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.save
    banana = WordsList::Words.new({:words => "Banana"})
    banana.save
    WordsList::Words.clear_all
    expect(WordsList::Words.all).to(eq({}))
  end

  it "can delete a word object from the word list" do
    apple = WordsList::Words.new({:words => "Apple"})
    apple.save
    apple.delete
    expect(WordsList::Words.all).to(eq({}))
  end
end

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

end

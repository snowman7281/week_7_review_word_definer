require ('rspec')
require ('pry')
require ('./lib/word_definer')

describe (Word) do
  before do
    Word.clear
  end

  describe('#word') do
    it('returns the word inputted') do
      test_word = Word.new({:word =>"word"})
      expect(test_word.word).to(eq("word"))
    end
  end

  describe('.all') do
   it('returns list of words') do
     test_word = Word.new({:word =>"word"})
     expect(Word.all).to(eq([]))
   end
 end

 describe('#save') do
    it('saves word into array') do
      test_word = Word.new({:word =>"word"})
      expect(test_word.save).to(eq([test_word]))
    end
  end

  describe('#definitions') do
     it('returns definition in an array')do
       test_word = Word.new({:word =>"word"})
       expect(test_word.definitions).to(eq([]))
     end
   end

   describe('#add_definitions') do
     it('adds the definitions to the selected word') do
       test_word = Word.new({:word =>"test"})
       test_definition = Definition.new({:definition => "this is the definition"})
       test_word.add_definitions(test_definition)
       expect(test_word.definitions).to(eq([test_definition]))
     end
   end

  describe('#id') do
    it("returns id of word") do
      test_word = Word.new({:word =>"test"})
      test_word.save
      expect(test_word.id).to(eq(1))
    end
  end

  describe('.find') do
    it("finds and returns the word by the id number") do
      test_word = Word.new({:word =>"test"})
      test_word.save
      expect(Word.find(test_word.id)).to(eq(test_word))
    end
  end
end

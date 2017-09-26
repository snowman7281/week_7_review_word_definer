require ('rspec')
require ('pry')
require ('./lib/definition')

describe('#definition') do
  it("returns the definition of a word") do
    test_definition = Definition.new({:definition => "this is the definition"})
    expect(test_definition.definition).to(eq("this is the definition"))
  end
end

describe('.all') do
    it("returns all the definitions of the word") do
      test_definition = Definition.new({:definition => "this is the definition"})
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves the definition") do
      test_definition = Definition.new({:definition =>"this is the definition"})
      expect(test_definition.save).to(eq(["this is the definition"]))
    end
  end

  describe('.clear') do
     it("clears the definitions list") do
       test_definition = Definition.new({:definition => "this is the definition"})
       test_definition.save
       Definition.clear
       expect(Definition.all).to(eq([]))
     end
   end

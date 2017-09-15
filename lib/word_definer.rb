module WordsList
  class Words
    @@word_list = {}

    attr_reader :definition
    attr_accessor :word

    def initialize(attributes)
      @word = attributes.fetch(:word)
      @definition = {}
    end

    def save
      words = @word
      if @@word_list.has_key?(word)
        return word + " is already defined in the list. Please enter another word."
      else
        @@word_list[word] = self
        return nil
      end
    end

    def self.find(word)
      if @@word_list.has_key?(word)
        return @@word_list[word]
      else
        return "Sorry can not find word"
      end
    end

    def add_word(word)
      @word = word
    end

    def add_definitions(definition, author)
      @definition[author] = definition
    end

    def self.all
      @@word_list
    end

    def self.clear_all
      @@word_list = {}
    end

    def delete
      word = @word
      if @@word_list.has_key?(word)
        @@word_list.delete(word)
      else
        return "Sorry can not find word."
      end
    end
  end
end

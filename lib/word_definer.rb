module WordsList
  class Words
    attr_accessor :words
    @@words_list = {}

    def initialize(attributes)
      @words = {}
    end

    def self.clear_all
      @@words_list = {}
    end

    def save
      @words = words
      if @@words_list.has_key?(words)
        return "That word is already defined in the list."
      else
        @@words_list[words] = self
        return nil
      end
    end

    def add_word(word, definition)
      @words[definition] = word
    end

    def self.all
      @@words_list
    end
  end
end

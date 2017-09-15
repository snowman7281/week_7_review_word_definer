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
      @@words_list[words] = self
      return nil
    end

    def add_word(word, definition)
      @words[definition] = word
    end

    def self.all
      @@words_list
    end
  end
end

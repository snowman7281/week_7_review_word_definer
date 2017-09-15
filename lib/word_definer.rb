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

    def add_word(word, definition)
      @words[definition] = word
    end
  end
end

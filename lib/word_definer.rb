module WordsList
  class Words
    attr_reader :words
    @@word_list = {}

    def initialize(attributes)
      @words = {}
    end

    def add_word(word, definition)
      @words[definition] = word
    end

  end

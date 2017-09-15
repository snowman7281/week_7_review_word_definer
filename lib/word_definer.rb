module WordsList
  class Words
    attr_reader :words
    @@words_list = {}

    def initialize(attributes)
      @words = attributes.fetch(:words)
    end

    def self.clear_all
      @@words_list = {}
    end

    def add_word(word)
      @words = word
    end
  end
end

module WordsList
  class Words

    attr_reader :definitions
    attr_accessor :words
    @@words_list = {}

    def initialize(attributes)
      @words = attributes.fetch(:words)
      @definitions = {}
    end

    def self.clear_all
      @@words_list = {}
    end

    def save
      words = @words
      if @@words_list.has_key?(words)
        return words + " is already defined in the list. Please enter another word."
      else
        @@words_list[words] = self
        return nil
      end
    end

    def self.find(words)
      if @@words_list.has_key?(words)
        return @@words_list[words]
      else
        return "Sorry can not find word"
      end
    end

    def add_word(words)
      @words = words
    end

    def self.all
      @@words_list
    end
  end
end

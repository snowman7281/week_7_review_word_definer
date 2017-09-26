class Definition
  attr_reader(:definition)
  @@definitions = []

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
  end

  def self.all
    @@definitions
  end

  def save
    @@definitions.push(self.definition)
  end

  def self.clear
    @@definitions = []
  end

end

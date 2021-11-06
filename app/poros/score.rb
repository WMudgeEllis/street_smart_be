class Score
  attr_reader :score,
              :description
  
  def initialize(attrs)
    @score = attrs[:walkscore]
    @description = attrs[:description]
  end
end

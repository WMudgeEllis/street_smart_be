class Score
  attr_reader :score,
              :description,
              :id

  def initialize(attrs)
    @score = attrs[:walkscore]
    @description = attrs[:description]
    @id = nil
  end
end

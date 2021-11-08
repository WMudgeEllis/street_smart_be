class ScoreFacade
  class << self
    def walk_safety_info(attrs)
      result = WalkScoreService.walk_score_by_location(attrs)
      Score.new(result)
    end
  end
end

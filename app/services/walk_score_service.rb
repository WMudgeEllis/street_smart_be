class WalkScoreService
  class << self

    def walk_score_by_location(attrs)
      url = "?format=json&lat=#{attrs[:latitude]}&lon=#{attrs[:longitude]}"
      WalkScoreClient.fetch(url)
    end
  end
end

class WalkScoreService
  class << self

    def walk_score_by_location(params)
      url = "?format=json&lat=#{params[:latitude]}&lon=#{params[:longitude]}&address=#{params[:address]}"
      WalkScoreClient.fetch(url)
    end
  end
end

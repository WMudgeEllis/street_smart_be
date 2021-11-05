class WalkScoreClient
  class << self

def fetch(url)
  response = conn.get(url + api_key)
  parse(response)
end

private
  def api_key
    "&wsapikey=#{ENV['walk_api_key']}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.walkscore.com/')
  end
end

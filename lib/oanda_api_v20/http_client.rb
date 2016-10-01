require 'unirest'

module OandaApiV20

  class HttpClient
    BASE_URL = 'https://api-fxpractice.oanda.com/v3'
    API_KEY = '4f0fe27db220e0ea7fe9c38cbe072ef4-1fed7556fe7e4a2d97b8ef430f8f2707'

    def self.get path
      Unirest.get(
        "#{BASE_URL}/#{path}",
        headers: { 
          'Authorization' => "Bearer #{API_KEY}",
          'Connection'    => 'keep-alive'
        }
      )
    end

  end

end

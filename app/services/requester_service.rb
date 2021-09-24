class RequesterService
  include HTTParty
  
  KEY = ENV['NOMICS_KEY'].freeze
  
  ALL_FIELDS = %w[
    id                        original_symbol
    name                      description
    website_url               logo_url
    blog_url                  discord_url
    facebook_url              github_url
    medium_url                reddit_url
    telegram_url              twitter_url
    whitepaper_url            youtube_url
    linkedin_url              block_explorer_url
    bitcointalk_url           replaced_by
    cryptocontrol_coin_id     used_for_pricing
  ].freeze
  
  class << self
    def currencies tickers, fields=ALL_FIELDS
      responce = HTTParty.get(
        'https://api.nomics.com/v1/currencies',
        query: {
          key: KEY,
          ids: (tickers || []).join(','),    
          attributes: fields,
        },
      )
      if responce.code == 200
        JSON.parse(responce.body)
      else
        false
      end
    end

    def fiat_price cc_ticker, fiat_ticker
      sleep 1 # because of Nomics free plan: 1 request per second only :(
      responce = HTTParty.get(
        'https://api.nomics.com/v1/currencies/ticker', 
        query: {
          key: KEY,
          ids: cc_ticker,
          convert: fiat_ticker,
        },
      )
      if responce.code == 200
        JSON.parse(responce.body).first[price].to_f
      else
        false
      end
    end
  end
end

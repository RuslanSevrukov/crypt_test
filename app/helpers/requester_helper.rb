class RequesterHelper
  include HTTParty

  @@key = ENV["NOMICS_KEY"].freeze
  
  @@all_fields = [
    "id",
    "original_symbol",
    "name",
    "description",
    "website_url",
    "logo_url",
    "blog_url",
    "discord_url",
    "facebook_url",
    "github_url",
    "medium_url",
    "reddit_url",
    "telegram_url",
    "twitter_url",
    "whitepaper_url",
    "youtube_url",
    "linkedin_url",
    "block_explorer_url",
    "bitcointalk_url",
    "replaced_by",
    "cryptocontrol_coin_id",
    "used_for_pricing",
  ].freeze

  def self.currencies tickers, fields=all_fields
    JSON.parse(HTTParty.get(
      "https://api.nomics.com/v1/currencies",
      query: {
        key: @@key,
        ids: (tickers || []).join(','),    
        attributes: fields,
      },
    ).body)
  end

  def self.fiat_price cc_ticker, fiat_ticker
    sleep 1 # because of Nomics free plan: 1 request per second only :(
    JSON.parse(
      HTTParty.get(
        "https://api.nomics.com/v1/currencies/ticker", 
        query: {
          key: @@key,
          ids: cc_ticker,
          convert: fiat_ticker,
        },
      ).body
    ).first["price"].to_f
  end
end

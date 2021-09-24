module RequesterHelper
  include HTTParty
  base_uri 'api.nomics.com/v1'

  headers = {
    key: ENV("NOMICS_KEY"),
  }.freeze
  
  all_fields = [
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

  def currencies tickers, fields=all_fields
    JSON.parse(HTTParty.get(
      "/currencies", 
      headers: headers,
      query: {
        ids: tickers,
        attributes: fields,
      },
    ).body)
  end

  def fiat_price cc_ticker, fiat_ticker
    JSON.parse(
      HTTParty.get(
        "/ticker", 
        headers: headers,
        query: {
          ids: [cc_ticker],
          convert: fiat_ticker,
        },
      ).body
    ).price.to_f
  end
end

module RequesterHelper
  include HTTParty
  base_uri 'api.nomics.com/v1'

  headers = {
    key: ENV("NOMICS_KEY"),
  }
  
  def currencies tickers, fields
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

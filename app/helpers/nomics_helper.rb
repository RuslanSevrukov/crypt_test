module NomicsHelper
  @@usd_cc_prices = {}

  

  def convert_cc_to_another cc_from_ticker, cc_to_ticker, amount
    amount * conversion_multiplier cc_from_ticker, cc_to_ticker
  end

  def conversion_multiplier cc_from_ticker, cc_to_ticker
    cc_to_usd cc_to_ticker / cc_to_usd cc_from_ticker
  end
  
  def cc_to_usd cc_ticker
    @@usd_cc_prices[cc_ticker] ||= # some request
  end
end

module NomicsHelper
  def convert_cc_to_another cc_from_ticker, cc_to_ticker, amount
    amount * conversion_multiplier cc_from_ticker, cc_to_ticker
  end

  def conversion_multiplier cc_from_ticker, cc_to_ticker
    usd_price cc_to_ticker / usd_price cc_from_ticker
  end
  
  def usd_price cc_ticker
    RequesterHelper.fiat_price cc_ticker, "USD"
  end
end

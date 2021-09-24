module NomicsHelper
  def convert_cc_to_fiat amount=1
    amount * RequesterHelper.fiat_price params[:cc_ticker], params[:fiat_ticker]
  end

  def convert_cc_to_cc cc_from_ticker, cc_to_ticker, amount=1
    amount * conversion_multiplier cc_from_ticker, cc_to_ticker
  end

  def conversion_multiplier cc_from_ticker, cc_to_ticker
    usd_price cc_to_ticker / usd_price cc_from_ticker
  end
  
  def usd_price cc_ticker
    RequesterHelper.fiat_price cc_ticker, "USD"
  end
end

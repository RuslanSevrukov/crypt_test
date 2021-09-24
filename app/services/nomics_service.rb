

class NomicsService
  class << self
    def convert_cc_to_fiat cc_ticker, fiat_ticker, amount
      (amount || 1) * RequesterService.fiat_price(cc_ticker, fiat_ticker)
    end

    def convert_cc_to_cc cc_from_ticker, cc_to_ticker, amount
      (amount || 1) * conversion_multiplier(cc_from_ticker, cc_to_ticker)
    end

    def conversion_multiplier cc_from_ticker, cc_to_ticker
      usd_price(cc_from_ticker) / usd_price(cc_to_ticker) 
    end
    
    def usd_price cc_ticker
      RequesterService.fiat_price(cc_ticker, "USD")
    end
  end
end

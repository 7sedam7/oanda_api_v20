module OandaApiV20

  class PriceType
    TRADEABLE     = 'tradeable' # The Instrument’s price is tradeable.
    NON_TRADEABLE = 'non-tradeable' # The Instrument’s price is not tradeable.
    INVALID       = 'invalid' # The Instrument of the price is invalid or there is no valid Price for the Instrument.
  end

  class UnitDetail
    attr_accessor :long,
                  :short

    def initialize unit_detail_response
      self.long  = unit_detail_response['long']
      self.short = unit_detail_response['short']
    end
  end

  class Unit
    attr_accessor :default,
                  :reduce_first,
                  :reduce_only,
                  :open_only

    def initialize unit_response
      self.default      = UnitDetail.new unit_response['default']
      self.reduce_first = UnitDetail.new unit_response['reduceFirst']
      self.reduce_only  = UnitDetail.new unit_response['reduceOnly']
      self.open_only    = UnitDetail.new unit_response['openOnly']
    end
  end

  class Price
    attr_accessor :instrument,
                  :time,
                  :status,
                  :bids,
                  :asks,
                  :closeout_bid,
                  :closeout_ask,
                  :quote_home_conversion_factors,
                  :units_available

    def initialize price_response
      self.instrument                    = price_response['instrument']
      self.time                          = price_response['time']
      self.status                        = price_response['status']
      self.bids                          = price_response['bids']
      self.asks                          = price_response['asks']
      self.closeout_bid                  = price_response['closeoutBid']
      self.closeout_ask                  = price_response['closeoutAsk']
      self.quote_home_conversion_factors = price_response['quoteHomeConversionFactors']
      self.units_available               = Unit.new price_response['unitsAvailable']
    end

    def self.all account_id, instrument
      HttpClient.get("accounts/#{account_id}/pricing?instruments=#{instrument}").body['prices'].map do |p|
        Price.new p
      end
    end
  end

end

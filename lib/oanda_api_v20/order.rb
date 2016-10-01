module OandaApiV20

  class OrderState
    PENDING   = 'PENDING'
    FILLED    = 'FILLED'
    TRIGGERED = 'TRIGGERED'
    CANCELLED = 'CANCELLED'
  end

  class OrderType
    MARKET             = 'MARKET'
    LIMIT              = 'LIMIT'
    STOP               = 'STOP'
    MARKET_IF_TOUCHED  = 'MARKET_IF_TOUCHED'
    TAKE_PROFIT        = 'TAKE_PROFIT'
    STOP_LOSS          = 'STOP_LOSS'
    TRAILING_STOP_LOSS = 'TRAILING_STOP_LOSS'
  end

  class TimeInForce
    GTC = 'GTC' # The Order is “Good unTil Cancelled”
    GTD = 'GTD' # The Order is “Good unTil Date” and will be cancelled at the provided time
    GFD = 'GFD' # The Order is “Good For Day” and will be cancelled at 5pm New York time
    FOK = 'FOK' # The Order must be immediately “Filled Or Killed”
    IOC = 'IOC' # The Order must be “Immediatedly paritally filled Or Cancelled”
  end

  class OrderPositionFill
    OPEN_ONLY    = 'OPEN_ONLY' # When the Order is filled, only allow Positions to be opened or extended.
    REDUCE_FIRST = 'REDUCE_FIRST' # When the Order is filled, always fully reduce an existing Position before opening a new Position.
    REDUCE_ONLY  = 'REDUCE_ONLY' # When the Order is filled, only reduce an existing Position.
    DEFAULT      = 'DEFAULT' # When the Order is filled, use REDUCE_FIRST behaviour for non-client hedging Accounts, and OPEN_ONLY behaviour for client hedging Accounts.
  end

  class Order
    attr_accessor :id,
                  :create_time,
                  :state,
                  :client_extensions,
                  :type

    def create
    end
  end

  class MarketOrder < Order
    attr_accessor :instrument,
                  :units,
                  :time_in_force,
                  :price_bound,
                  :position_fill,
                  :trade_close,
                  :long_position_closeout,
                  :short_position_closeout,
                  :margin_closeout,
                  :delayed_trade_close,
                  :take_profit_on_fill,
                  :stop_loss_on_fill,
                  :trailing_stop_loss_on_fill,
                  :trade_client_extensions,
                  :filling_transaction_id,
                  :filled_time,
                  :trade_opened_id,
                  :trade_reduced_id,
                  :trade_closed_ids,
                  :cancelling_transaction_id,
                  :cancelled_time

    def initialize
      self.type = OrderType.MARKET
    end

    def create
    end
  end

  class LimitOrder < Order
  end

  class StopOrder < Order
  end

  class MarketIfTouchedOrder < Order
  end

  class TakeProfitOrder < Order
  end

  class StopLossOrder < Order
  end

  class TrailingStopLossOrder < Order
  end

end

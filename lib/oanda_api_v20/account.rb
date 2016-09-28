module OandaApiV20

  class Account
    attr_accessor :id,
                  :alias,
                  :currency,
                  :division_trading_group_id,
                  :balance,
                  :created_by_user_id,
                  :created_time,
                  :pl,
                  :resettable_pl,
                  :resettable_pl_time,
                  :margin_rate,
                  :margin_call_enter_time,
                  :margin_call_extension_count,
                  :last_margin_call_extension_time,
                  :open_trade_count,
                  :open_position_count,
                  :pending_order_count,
                  :hedging_enabled,
                  :unrealized_pl,
                  :nav,
                  :margin_used,
                  :margin_available,
                  :position_value,
                  :margin_closeout_unrealized_pl,
                  :margin_closeout_nav,
                  :margin_closeout_margin_used,
                  :margin_closeout_percent,
                  :withdrawal_limit,
                  :margin_call_margin_used,
                  :margin_call_percent,
                  :last_transaction_id,
                  :trades,
                  :positions,
                  :orders,

    def self.all
    end

    def self.get(account_id)
    end

    def instruments
    end

    def instrument(instrument_name)
    end

    def update(new_alias, new_margin_rate)
    end

  end

end

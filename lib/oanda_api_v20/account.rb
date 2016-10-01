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
                  :orders

    def initialize account_response
      self.id       = account_response['id']
      self.alias    = account_response['alias']
      self.currency = account_response['currency']
      self.balance  = account_response['balance']
      self.nav      = account_response['NAV']
    end

    def self.all
      HttpClient.get('accounts').body['accounts'].map do |acc|
        self.get acc['id']
      end
    end

    def self.get(account_id)
      Account.new HttpClient.get("accounts/#{account_id}").body['account']
    end

    def instruments
      HttpClient.get("accounts/#{self.id}/instruments").body['instruments']
    end

    def instrument(instrument_name)
    end

    def update(new_alias, new_margin_rate)
    end

  end

end

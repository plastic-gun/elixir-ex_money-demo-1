import Config

open_exchange_rates_app_id = System.fetch_env!("OPEN_EXCHANGE_RATES_APP_ID")

config :demo, Demo.ExchangeRatesInSingleMode,
  mode: :single,
  retriever_adapter: Money.ExchangeRatesLite.Retriever.OpenExchangeRates,
  retriever_options: [
    app_id: open_exchange_rates_app_id
  ],
  cache_adapter: Money.ExchangeRatesLite.Cache.Ets,
  retrieve_every: 300_000

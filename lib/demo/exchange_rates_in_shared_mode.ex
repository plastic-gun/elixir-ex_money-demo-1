defmodule Demo.ExchangeRatesInSharedMode do
  @moduledoc """
  Runs `Money.ExchangeRatesLite` in shared mode.
  """

  @pool_name __MODULE__

  def child_spec(_) do
    pool_args = [
      name: {:local, @pool_name},
      worker_module: Money.ExchangeRatesLite,
      size: 5,
      max_overflow: 2
    ]

    worker_args =
      config!()
      |> Keyword.put(:shared_name, @pool_name)

    %{
      id: @pool_name,
      start: {:poolboy, :start_link, [pool_args, worker_args]}
    }
  end

  def last_updated() do
    :poolboy.transaction(@pool_name, fn server ->
      Money.ExchangeRatesLite.last_updated(server)
    end)
  end

  def latest_rates() do
    :poolboy.transaction(@pool_name, fn server ->
      Money.ExchangeRatesLite.latest_rates(server)
    end)
  end

  def latest_rates(date) do
    :poolboy.transaction(@pool_name, fn server ->
      Money.ExchangeRatesLite.historic_rates(server, date)
    end)
  end

  defp config!() do
    Application.fetch_env!(:demo, __MODULE__)
  end
end

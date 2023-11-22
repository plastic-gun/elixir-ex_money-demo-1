defmodule Demo.ExchangeRatesInSingleMode do
  @moduledoc """
  Runs `Money.ExchangeRatesLite` in single mode.
  """

  def child_spec(_) do
    config!()
    |> Keyword.put(:name, __MODULE__)
    |> Money.ExchangeRatesLite.child_spec()
  end

  def last_updated(), do: Money.ExchangeRatesLite.last_updated(__MODULE__)
  def latest_rates(), do: Money.ExchangeRatesLite.latest_rates(__MODULE__)
  def historic_rates(date), do: Money.ExchangeRatesLite.historic_rates(__MODULE__, date)

  defp config!() do
    Application.fetch_env!(:demo, __MODULE__)
  end
end

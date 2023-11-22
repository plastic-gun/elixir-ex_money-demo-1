defmodule Demo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Supervisor.child_spec(Demo.ExchangeRatesInSingleMode, id: Demo.ExchangeRatesInSingleMode),
      Supervisor.child_spec(Demo.ExchangeRatesInSharedMode, id: Demo.ExchangeRatesInSharedMode)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Demo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

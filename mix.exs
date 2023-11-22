defmodule Demo.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :observer, :runtime_tools, :wx],
      mod: {Demo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_money, github: "plastic-forks/money", branch: "zd/exchange-rates-lite"},
      {:poolboy, "~> 1.5"},
      {:jason, "~> 1.0"}
    ]
  end
end

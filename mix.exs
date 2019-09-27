defmodule SherlockMem.MixProject do
  use Mix.Project

  def project do
    [
      app: :sherlock_mem,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Memory tracer for GenServer",
      package: package(),
      name: "SherlockMem"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:recon, "~> 2.5"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package() do
    [
      name: "sherlock_mem",
      files: ~w(lib .formatter.exs mix.exs README*
                CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/timuryan/sherlock_mem"}
    ]
  end
end

defmodule Scrivener.Mixfile do
  use Mix.Project

  def project do
    [
      app: :scrivener,
      version: "0.7.0",
      elixir: "~> 1.0",
      elixirc_paths: elixirc_paths(Mix.env),
      package: package,
      description: "Paginate your Ecto queries",
      deps: deps,
      docs: [
        main: Scrivener,
        readme: "README.md"
      ]
    ]
  end

  def application do
    [
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: [:postgrex, :ecto, :logger]
  defp applications(_), do: [:logger]

  defp deps do
    [
      {:ecto, "~> 0.11.3"},
      {:dialyze, "~> 0.1.4", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev},
      {:ex_spec, "~> 0.3.0", only: :test},
      {:postgrex, ">= 0.0.0", only: :test, override: true}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      contributors: ["Drew Olson"],
      licenses: ["MIT"],
      links: %{"github" => "https://github.com/drewolson/scrivener"},
      files: [
        "lib",
        "mix.exs",
        "README.md"
      ]
    ]
  end
end

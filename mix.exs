defmodule RandomUser.Mixfile do
  use Mix.Project

  def project do
    [
      app: :random_user,
      version: "0.2.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      package: package(),
      deps: deps(),
      name: "RandomUser",
      description: "An Elixir library to generate fake/mock/random user profiles.",
      source_url: "https://github.com/atmd83/elixir-random-user"
    ]
  end

  def application do
    [extra_applications: [:logger, :httpoison]]
  end

  defp package() do
    [
      name: "random_user",
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Andrew Markham-Davies"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/atmd83/elixir-random-user"}
    ]
  end

  defp deps do
    [{:httpoison, "~> 0.13"}, {:poison, "~> 3.1"}, {:ex_doc, "~> 0.14", only: :dev}]
  end
end

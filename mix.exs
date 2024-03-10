defmodule PhxOtpInput.MixProject do
  use Mix.Project

  def project do
    [
      app: :phx_otp_input,
      name: "OtpInput",
      version: "0.1.0",
      elixir: "~> 1.14",
      description: "A Phoenix LiveView OTP input. With a layer on top of input-otp JS library.",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {PhxOtpInput.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]

  defp elixirc_paths(:prod) do
    # Do not compile web modules when used as dependency
    ["lib/live_select", "lib/live_select.ex"]
  end

  defp elixirc_paths(_) do
    ["lib"]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.11"},
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.20.2"},
      {:floki, ">= 0.30.0", only: :test},
      # TODO - Add demo environment
      {:esbuild, "~> 0.8", only: [:dev, :test, :demo]},
      {:tailwind, "~> 0.2", only: :dev, optional: true},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.1.1"},
      {:bandit, "~> 1.2"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd --cd assets yarn"],
      "assets.package": ["esbuild package"],
      "assets.deploy": [
        "cmd --cd assets yarn",
        "tailwind default --minify",
        "esbuild default --minify",
        "phx.digest"
      ]
    ]
  end
end

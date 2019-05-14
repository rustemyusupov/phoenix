use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, ApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :junit_formatter,
  report_dir: "./cover"
  
# Configure your database
config :api, Api.Repo,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  database: "api_test",
  hostname: System.get_env("PGHOST"),
  port: System.get_env("PGPORT") |> String.to_integer,
  pool: Ecto.Adapters.SQL.Sandbox

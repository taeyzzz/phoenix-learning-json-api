use Mix.Config

# Configure your database
config :taey_api, TaeyAPI.Repo,
  username: "postgres",
  password: "postgres",
  database: "taey_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :taey_api, TaeyAPIWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

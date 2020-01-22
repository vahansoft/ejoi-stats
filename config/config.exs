# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :ejoi_stats,
  ecto_repos: [EjoiStats.Repo]

config :ejoi_stats_web,
  ecto_repos: [EjoiStats.Repo],
  generators: [context_app: :ejoi_stats]

# Configures the endpoint
config :ejoi_stats_web, EjoiStatsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "h3L6y5/r3AKzjA0tBu+YzFv6txa2v6dRk/yFPtREq6BwVw91bjt8MSvbbAyCKbSc",
  render_errors: [view: EjoiStatsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EjoiStatsWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

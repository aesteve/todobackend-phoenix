# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :todobackendphoenix, Todobackendphoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "todobackendphoenix_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"


# General application configuration
config :todobackendphoenix,
  ecto_repos: [Todobackendphoenix.Repo]

# Configures the endpoint
config :todobackendphoenix, Todobackendphoenix.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZzFkQc6zvUeE2Gv8S2YGIHCMqUkoj0hbwTqCeGeR9Ixmt7DzGnv1rySsi7EEEe/s",
  render_errors: [view: Todobackendphoenix.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Todobackendphoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

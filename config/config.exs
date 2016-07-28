# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rumbl_again,
  ecto_repos: [RumblAgain.Repo]

# Configures the endpoint
config :rumbl_again, RumblAgain.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wln7ypZ/grYTNE8jvD8ZUsSdTH4HvTMAGI+PXkeonoGkAXFi6eNKiU+ezmhzo2ZN",
  render_errors: [view: RumblAgain.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RumblAgain.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

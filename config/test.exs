import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hello_sockets, HelloSocketsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "SdGMQVi0SsIH9dF2kdUYnqgdNU1cgGieOa/k6xZM6jrnbidcEk5QTGyxM7AM5giA",
  server: false

# In test we don't send emails.
config :hello_sockets, HelloSockets.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

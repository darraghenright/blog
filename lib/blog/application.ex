defmodule Blog.Application do
  @moduledoc false
  use Application
  use Boundary, deps: [Blog, BlogWeb], top_level?: true

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Blog.Repo,
      # Start the Telemetry supervisor
      BlogWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Blog.PubSub},
      # Start the Endpoint (http/https)
      BlogWeb.Endpoint
      # Start a worker by calling: Blog.Worker.start_link(arg)
      # {Blog.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Blog.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BlogWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

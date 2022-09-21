defmodule Enforcer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Enforcer.Game, :superman},
      {Enforcer.Game, :ironman}
    ]

    IO.puts("Starting application")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: :sup]
    Supervisor.start_link(children, opts)
  end
end

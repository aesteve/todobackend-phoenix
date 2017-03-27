defmodule Todobackendphoenix.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Todobackendphoenix.Repo, []),
      supervisor(Todobackendphoenix.Web.Endpoint, []),
    ]

    opts = [strategy: :one_for_one, name: Todobackendphoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

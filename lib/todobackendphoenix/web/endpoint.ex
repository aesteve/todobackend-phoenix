defmodule Todobackendphoenix.Web.Endpoint do
  use Phoenix.Endpoint, otp_app: :todobackendphoenix

  plug CORSPlug
  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Todobackendphoenix.Web.Router
end

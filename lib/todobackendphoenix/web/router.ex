defmodule Todobackendphoenix.Web.Router do
  use Todobackendphoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Todobackendphoenix.Web do
    pipe_through :api # Use the default browser stack

    resources "/", TodoController
    delete "/", TodoController, :delete_all
  end

end

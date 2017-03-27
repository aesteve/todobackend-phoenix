defmodule Todobackendphoenix.Web.ErrorView do
  use Todobackendphoenix.Web, :view

  def render("404.json", _assigns) do
    "Page not found"
  end

  def render("500.json", _assigns) do
    "Internal server error"
  end


  def render("400.json", %{kind: _kind, reason: reason, stack: _stack, conn: _conn}) do
    %{
        reason: reason
    }
  end


end

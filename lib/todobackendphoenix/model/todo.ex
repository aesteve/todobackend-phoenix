defmodule Todobackendphoenix.Model.Todo do
  use Ecto.Schema

  schema "todobackend_todos" do
    field :title, :string
    field :completed, :boolean, default: false
    field :order, :integer, default: 0

    timestamps()
  end
end

defmodule Todobackendphoenix.Repo.Migrations.CreateTodobackendphoenix.Todobackend.Todo do
  use Ecto.Migration

  def change do
    create table(:todobackend_todos) do
      add :title, :string
      add :order, :integer
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end

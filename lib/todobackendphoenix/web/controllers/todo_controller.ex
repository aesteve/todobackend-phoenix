defmodule Todobackendphoenix.Web.TodoController do
  use Todobackendphoenix.Web, :controller

  alias Todobackendphoenix.Todos
  alias Todobackendphoenix.Model.Todo

  action_fallback Todobackendphoenix.Web.FallbackController

  def index(conn, _params) do
    todos = Todos.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, todo_params) do
    with {:ok, %Todo{} = todo} <- Todos.create_todo(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, todo_params = %{"id" => id}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{} = todo} <- Todos.update_todo(todo, todo_params) do
      render(conn, "show.json", todo: todo)
    end
  end

  def delete_all(conn, _params) do
    render(conn, "index.json", todos: Todos.clean())
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    with {:ok, %Todo{}} <- Todos.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end

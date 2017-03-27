defmodule Todobackendphoenix.Web.TodoView do
  use Todobackendphoenix.Web, :view
  alias Todobackendphoenix.Web.TodoView

  def render("index.json", %{todos: todos}) do
    render_many(todos, TodoView, "todo.json")
  end

  def render("show.json", %{todo: todo}) do
    render_one(todo, TodoView, "todo.json")
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      title: todo.title,
      order: todo.order,
      completed: todo.completed,
      url: todo_url(Todobackendphoenix.Web.Endpoint, :show, todo)}
  end
end

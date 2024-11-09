defmodule FlintDemoWeb.BooksLive do
  use FlintDemoWeb, :live_view

  alias FlintDemo.Repo
  alias FlintDemo.Schema.Book

  def render(assigns) do
    ~H"""
    <h1>Books</h1>
    <ul>
      <li :for={book <- @books}>
        <.link navigate={~p"/books/#{book.id}"}><%= book.title %></.link>
        <.button phx-click="delete" phx-value-id={book.id}>Delete</.button>
      </li>
    </ul>
    <.link navigate={~p"/books/new"}>New Book</.link>
    """
  end

  def mount(_params, _session, socket) do
    books = Repo.all(Book)
    {:ok, assign(socket, books: books)}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    id = String.to_integer(id)
    Book |> Repo.get!(id) |> Repo.delete()
    {:noreply, redirect(socket, to: ~p"/books")}
  end
end

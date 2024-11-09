defmodule FlintDemoWeb.BookLive do
  use FlintDemoWeb, :live_view

  alias FlintDemo.Repo
  alias FlintDemo.Schema.Book

  defmodule Form do
    use Flint.Schema

    embedded_schema do
      field! :title, :string
    end
  end

  def render(assigns) do
    ~H"""
    <h1>New Book</h1>
    <.form for={@form} phx-change="validate" phx-submit="save">
      <.input field={@form[:title]} />
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    form = %Form{} |> Form.changeset(%{}) |> to_form()
    {:ok, assign(socket, form: form)}
  end

  def handle_event("validate", %{"form" => params}, socket) do
    form = %Form{} |> Form.changeset(params) |> to_form(action: :validate)
    {:noreply, assign(socket, form: form)}
  end

  def handle_event("save", %{"form" => params}, socket) do
    changeset = %Form{} |> Form.changeset(params)

    %Book{} |> Ecto.Changeset.change(changeset.changes) |> Repo.insert()

    {:noreply, redirect(socket, to: ~p"/books")}
  end
end

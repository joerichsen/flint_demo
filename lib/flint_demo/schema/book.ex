defmodule FlintDemo.Schema.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :published_on, :date
    field :price_cents, :integer
    field :price_amount, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :published_on, :price_cents, :price_amount])
    |> validate_required([:title, :published_on, :price_cents, :price_amount])
  end
end

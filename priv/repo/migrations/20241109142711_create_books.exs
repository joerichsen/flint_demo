defmodule FlintDemo.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :published_on, :date
      add :price_cents, :integer
      add :price_amount, :string

      timestamps(type: :utc_datetime)
    end
  end
end

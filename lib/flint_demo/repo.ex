defmodule FlintDemo.Repo do
  use Ecto.Repo,
    otp_app: :flint_demo,
    adapter: Ecto.Adapters.SQLite3
end

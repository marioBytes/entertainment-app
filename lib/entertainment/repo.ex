defmodule Entertainment.Repo do
  use Ecto.Repo,
    otp_app: :entertainment,
    adapter: Ecto.Adapters.Postgres
end

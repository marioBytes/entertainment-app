defmodule Entertainment.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :rating, :string

      timestamps()
    end
  end
end

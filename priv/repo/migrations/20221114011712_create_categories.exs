defmodule Entertainment.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :category, :string

      timestamps()
    end
  end
end

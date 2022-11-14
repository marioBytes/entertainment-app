defmodule Entertainment.Repo.Migrations.CreateVideoCategory do
  use Ecto.Migration

  def change do
    create table(:video_category) do
      add :video_id, references(:videos, on_delete: :nothing)
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:video_category, [:video_id, :category_id])
  end
end

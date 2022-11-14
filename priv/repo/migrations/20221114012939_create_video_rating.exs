defmodule Entertainment.Repo.Migrations.CreateVideoRating do
  use Ecto.Migration

  def change do
    create table(:video_rating) do
      add :video_id, references(:videos, on_delete: :nothing)
      add :rating_id, references(:ratings, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:video_rating, [:video_id, :rating_id])
  end
end

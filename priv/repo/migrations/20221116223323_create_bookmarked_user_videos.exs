defmodule Entertainment.Repo.Migrations.CreateBookmarkedUserVideos do
  use Ecto.Migration

  def change do
    create table(:bookmarked_user_videos) do
      add :user_id, references(:users, on_delete: :nothing)
      add :video_id, references(:videos, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:bookmarked_user_videos, [:user_id, :video_id])
  end
end

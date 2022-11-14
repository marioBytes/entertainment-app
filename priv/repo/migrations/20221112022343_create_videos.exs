defmodule Entertainment.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :year, :integer
      add :is_trending, :boolean, default: false, null: false

      timestamps()
    end
  end
end

defmodule Entertainment.Media.Video do
  use Ecto.Schema
  import Ecto.Changeset

  schema "videos" do
    field :is_trending, :boolean, default: false
    field :title, :string
    field :year, :integer
    field :category, :string
    field :rating, :string

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:title, :year, :is_trending, :category, :rating])
    |> validate_required([:title, :year, :is_trending, :category, :rating])
  end
end

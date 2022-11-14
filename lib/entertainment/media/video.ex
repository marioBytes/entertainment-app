defmodule Entertainment.Media.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias Entertainment.Media.{VideoCategory, VideoRating}

  schema "videos" do
    field :is_trending, :boolean, default: false
    field :title, :string
    field :year, :integer

    has_one :category, VideoCategory
    has_one :rating, VideoRating

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:title, :year, :is_trending])
    |> validate_required([:title, :year, :is_trending])
  end
end

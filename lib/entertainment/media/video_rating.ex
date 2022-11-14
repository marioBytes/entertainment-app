defmodule Entertainment.Media.VideoRating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "video_rating" do
    field :video_id, :id
    field :rating_id, :id

    timestamps()
  end

  @doc false
  def changeset(video_rating, attrs) do
    video_rating
    |> cast(attrs, [:video_id, :rating_id])
    |> validate_required([:video_id, :rating_id])
    |> unique_constraint([:video_id, :rating_id])
    |> unsafe_validate_unique([:video_id, :category_id], Entertainment.Repo,
      message: "Video cannot have multiple categories"
    )
  end
end

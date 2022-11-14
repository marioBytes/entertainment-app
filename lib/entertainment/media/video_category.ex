defmodule Entertainment.Media.VideoCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "video_category" do
    field :video_id, :id
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(video_category, attrs) do
    video_category
    |> cast(attrs, [:video_id, :category_id])
    |> validate_required([:video_id, :category_id])
    |> unique_constraint([:video_id, :category_id])
    |> unsafe_validate_unique([:video_id, :category_id], Entertainment.Repo,
      message: "Video cannot have multiple ratings"
    )
  end
end

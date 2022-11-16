defmodule Entertainment.Accounts.BookmarkedUserVideo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bookmarked_user_videos" do
    belongs_to :video, Entertainment.Media.Video
    belongs_to :user, Entertainment.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(bookmarked_user_video, attrs) do
    bookmarked_user_video
    |> cast(attrs, [:user_id, :video_id])
    |> validate_required([:user_id, :video_id])
    |> unique_constraint([:user_id, :video_id])
    |> unsafe_validate_unique([:user_id, :video_id], Entertainment.Repo,
      message: "Video is already bookmarked"
    )
  end
end

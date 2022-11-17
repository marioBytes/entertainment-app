defmodule Entertainment.Media do
  alias Entertainment.Media.Video
  alias Entertainment.Accounts.BookmarkedUserVideo

  alias Entertainment.Repo

  def list_videos do
    Video.Query.base()
    |> Repo.all()
  end

  def get_video!(id) do
    Video.Query.single_video(id)
    |> Repo.one()
  end

  def create_video(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  def update_video(%Video{} = video, attrs) do
    video
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  def delete_video(%Video{} = video) do
    Repo.delete(video)
  end

  def change_video(%Video{} = video, attrs \\ %{}) do
    Video.changeset(video, attrs)
  end

  def get_bookmarked_user_video(user_id, video_id) do
    BookmarkedUserVideo
    |> Repo.get_by(%{user_id: user_id, video_id: video_id})
  end
end

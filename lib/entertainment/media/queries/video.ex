defmodule Entertainment.Media.Video.Query do
  import Ecto.Query

  alias Entertainment.Accounts.BookmarkedUserVideo
  alias Entertainment.Media.Video

  def base() do
    Video
  end

  def single_video(id) do
    base() |> where([v], v.id == ^id)
  end

  def search_by_title(query_string) do
    base() |> where([v], ilike(v.title, ^"%#{query_string}%"))
  end

  def search_by_title_and_category(query_string, category) do
    search_by_title(query_string) |> where([v], v.category == ^category)
  end

  def search_user_bookmarked_videos_by_title(query_string, user_id) do
    BookmarkedUserVideo
    |> join(:inner, [buv], v in Video, on: buv.video_id == v.id and buv.user_id == ^user_id)
    |> select([_buv, v], v)
    |> where([_buv, v], ilike(v.title, ^"%#{query_string}%"))
  end
end

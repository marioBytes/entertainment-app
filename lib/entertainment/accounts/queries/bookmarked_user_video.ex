defmodule Entertainment.Accounts.BookmarkedUserVideo.Query do
  import Ecto.Query

  alias Entertainment.Accounts.BookmarkedUserVideo

  def base() do
    BookmarkedUserVideo
  end

  def preload_bookmarked_videos(query) do
    query |> preload(bookmarked_videos: :video)
  end
end

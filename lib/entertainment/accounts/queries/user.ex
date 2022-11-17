defmodule Entertainment.Accounts.User.Query do
  import Ecto.Query

  alias Entertainment.Accounts
  alias Entertainment.Accounts.BookmarkedUserVideo

  def base() do
    Accounts.User
  end

  def with_bookmarked_videos(user_id) when is_integer(user_id) do
    user_by_id(user_id) |> BookmarkedUserVideo.Query.preload_bookmarked_videos()
  end

  def with_bookmarked_videos(user_email) when is_bitstring(user_email) do
    user_by_email(user_email) |> BookmarkedUserVideo.Query.preload_bookmarked_videos()
  end

  def with_bookmarked_videos(_) do
    nil
  end

  defp user_by_id(user_id) do
    base() |> where([u], u.id == ^user_id)
  end

  defp user_by_email(user_email) do
    base() |> where([u], u.email == ^user_email)
  end
end

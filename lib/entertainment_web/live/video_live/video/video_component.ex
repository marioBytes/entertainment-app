defmodule EntertainmentWeb.VideoLive.Video.VideoComponent do
  use EntertainmentWeb, :live_component

  alias Entertainment.Accounts
  alias Entertainment.Accounts.BookmarkedUserVideo
  alias Entertainment.Media

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign_video_is_bookmarked?(assigns.video.id)}
  end

  @impl true
  def handle_event(
        "add-video-bookmark",
        _,
        %{assigns: %{video: video, current_user: user}} = socket
      ) do
    case Accounts.bookmark_video(%{user_id: user.id, video_id: video.id}) do
      {:ok, _} ->
        {:noreply, assign_video_is_bookmarked?(socket, true)}

      {:error, %Ecto.Changeset{}} ->
        {:noreply, put_flash(socket, :error, "There was an error when bookmarking this video")}
    end
  end

  @impl true
  def handle_event(
        "remove-video-bookmark",
        _,
        %{assigns: %{video: video, current_user: user}} = socket
      ) do
    bookmarked_user_video = Media.get_bookmarked_user_video(user.id, video.id)

    case bookmarked_user_video do
      %BookmarkedUserVideo{} = buv ->
        case Accounts.remove_bookmarked_video(buv) do
          {:ok, _} ->
            {:noreply, assign_video_is_bookmarked?(socket, false)}

          {:error, %Ecto.Changeset{}} ->
            {:noreply,
             put_flash(socket, :error, "There was an error when removing this bookmarked video")}
        end

      nil ->
        socket =
          socket |> put_flash(:error, "There was an error when removing this bookmarked video")

        {:noreply, socket}
    end
  end

  defp assign_video_is_bookmarked?(socket, value) when is_integer(value) do
    bookmarked? = video_is_bookmarked?(socket, value)

    assign(socket, :video_is_bookmarked, bookmarked?)
  end

  defp assign_video_is_bookmarked?(socket, value) when is_boolean(value) do
    assign(socket, :video_is_bookmarked, value)
  end

  defp video_is_bookmarked?(%{assigns: %{current_user: nil}}, _) do
    false
  end

  defp video_is_bookmarked?(%{assigns: %{current_user: %{bookmarked_videos: videos}}}, video_id) do
    video_ids = map_bookmarked_video_ids(videos)

    video_id in video_ids
  end

  defp map_bookmarked_video_ids(bookmarked_videos) do
    Enum.map(bookmarked_videos, fn bookmarked_video ->
      bookmarked_video.video_id
    end)
  end
end

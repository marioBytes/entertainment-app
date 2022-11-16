defmodule EntertainmentWeb.VideoLive.Show do
  use EntertainmentWeb, :live_view

  alias Entertainment.Media
  alias Entertainment.Accounts
  alias Entertainment.Accounts.BookmarkedUserVideo

  @impl true
  def mount(%{"id" => video_id}, _session, socket) do
    {:ok, socket |> assign_video_is_bookmarked?(video_id)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:video, Media.get_video!(id))}
  end

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

  defp assign_video_is_bookmarked?(socket, value) when is_bitstring(value) do
    bookmarked? = video_is_bookmarked?(socket, value)

    assign(socket, :video_is_bookmarked, bookmarked?)
  end

  defp assign_video_is_bookmarked?(socket, value) when is_boolean(value) do
    assign(socket, :video_is_bookmarked, value)
  end

  defp video_is_bookmarked?(%{assigns: %{current_user: %{bookmarked_videos: videos}}}, video_id) do
    video_ids = map_bookmarked_video_ids(videos)

    video_id in video_ids
  end

  defp map_bookmarked_video_ids(bookmarked_videos) do
    Enum.map(bookmarked_videos, fn bookmarked_video ->
      Integer.to_string(bookmarked_video.video_id)
    end)
  end

  defp page_title(:show), do: "Show Video"
  defp page_title(:edit), do: "Edit Video"
end

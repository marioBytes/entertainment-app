defmodule EntertainmentWeb.VideoLive.Index do
  use EntertainmentWeb, :live_view

  alias Entertainment.Media

  alias EntertainmentWeb.VideoLive.Video.VideoComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :videos, list_videos(socket.assigns.current_user))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, socket}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Videos")
    |> assign(:video, nil)
  end

  defp list_videos(%{bookmarked_videos: bookmarked_videos}) do
    Media.list_videos()
  end
end

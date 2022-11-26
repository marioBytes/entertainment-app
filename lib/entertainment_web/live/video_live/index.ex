defmodule EntertainmentWeb.VideoLive.Index do
  use EntertainmentWeb, :live_view

  alias Entertainment.Media

  alias EntertainmentWeb.VideoLive.Video.VideoComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :videos, list_videos())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket |> assign(:page_title, "All Videos")
  end

  defp apply_action(socket, :movies, _params) do
    socket
    |> assign(:page_title, "Movies")
    |> assign_movies()
  end

  defp apply_action(socket, :tv_series, _params) do
    socket
    |> assign(:page_title, "TV Series")
    |> assign_tv_series()
  end

  defp apply_action(socket, :bookmarked_videos, _params) do
    socket
    |> assign(:page_title, "Bookmarked Videos")
    |> assign_bookmarked_videos()
  end

  defp assign_movies(socket) do
    movies = Media.list_videos_by_category("Movie")

    assign(socket, :videos, movies)
  end

  defp assign_tv_series(socket) do
    tv_series = Media.list_videos_by_category("TV Series")

    assign(socket, :videos, tv_series)
  end

  defp assign_bookmarked_videos(%{assigns: %{current_user: nil}} = socket) do
    assign(socket, :videos, [])
  end

  defp assign_bookmarked_videos(%{assigns: %{current_user: %{bookmarked_videos: bookmarked_videos}}} = socket) do
    assign(socket, :videos, get_videos(bookmarked_videos))
  end

  defp list_videos() do
    Media.list_videos()
  end

  defp get_videos(bookmarked_videos) do
    Enum.map(bookmarked_videos, fn %{video: video} -> video end)
  end
end

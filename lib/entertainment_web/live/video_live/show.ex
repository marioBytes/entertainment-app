defmodule EntertainmentWeb.VideoLive.Show do
  use EntertainmentWeb, :live_view

  alias Entertainment.Media

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:video, Media.get_video!(id))}
  end

  defp page_title(:show), do: "Show Video"
  defp page_title(:edit), do: "Edit Video"
end

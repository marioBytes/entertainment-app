defmodule EntertainmentWeb.PageLive.Index do
  use EntertainmentWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end

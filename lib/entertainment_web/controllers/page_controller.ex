defmodule EntertainmentWeb.PageController do
  use EntertainmentWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

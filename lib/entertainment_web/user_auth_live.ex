defmodule EntertainmentWeb.UserAuthLive do
  import Phoenix.LiveView

  alias Entertainment.Accounts

  def on_mount(_, _params, session, socket) do
    {:cont, socket |> assign_user(session)}
  end

  defp assign_user(socket, %{"user_token" => user_token}) when not is_nil(user_token) do
    assign_new(socket, :current_user, fn -> Accounts.get_user_by_session_token(user_token) end)
  end

  defp assign_user(socket, _) do
    assign_new(socket, :current_user, fn -> nil end)
  end
end

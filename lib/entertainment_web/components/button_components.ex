defmodule EntertainmentWeb.Components.Buttons do
  use Phoenix.Component
  use EntertainmentWeb, :live_view

  def button(assigns) do
    assigns =
      assigns
      |> assign_class()
      |> assign_is_button()

    ~H"""
      <%= link to: "#{@to}", class: "#{@class} #{@class_names}" do %>
        <%= render_slot(@inner_block) %>
      <% end %>
    """
  end

  def button_primary(assigns) do
    ~H"""
      <.button class_names="bg-button-color hover:bg-button-color-hover hover:text-black" to={@to}>
        <%= render_slot(@inner_block) %>
      </.button>
    """
  end

  def button_secondary(assigns) do
    ~H"""
      <.button class_names="bg-button-color-hover hover:bg-button-color text-black hover:text-white" to={@to}>
        <%= render_slot(@inner_block) %>
      </.button>
    """
  end

  defp assign_class(assigns) do
    assigns
    |> assign(
      :class,
      "transition-colors duration-300 hover:transition-colors hover:duration-300 ease-in-out hover:ease-in-out
      rounded-md py-2 px-3 text-sm"
    )
  end

  defp assign_is_button(assigns) do
    assigns
    |> assign(:is_button, false)
  end
end

defmodule EntertainmentWeb.InputComponent do
  use Phoenix.Component

  def text_input(assigns) do
    ~H"""
      <input
        id={@id}
        name={@name}
        type={@type}
        required={@required}
        placeholder={@placeholder}
        class="input outline-none caret-button-color w-full"
      />
    """
  end

  def label(assigns) do
    ~H"""
      <label for={@for} class="w-full">
        <%= render_slot(@inner_block) %>
      </label>
    """
  end

  def input_field(assigns) do
    assigns = assign_new(assigns, :required, fn -> false end)

    ~H"""
      <.label for={@for}>
        <.text_input
          id={@id}
          name={@name}
          type={@type}
          placeholder={@placeholder}
          required={@required}
        />
      </.label>
    """
  end
end

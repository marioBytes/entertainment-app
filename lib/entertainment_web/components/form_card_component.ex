defmodule EntertainmentWeb.Components.FormCard do
  use Phoenix.Component
  use EntertainmentWeb, :live_view

  def card(assigns) do
    ~H"""
      <div class="bg-secondary-color xl:w-1/4 lg:w-2/5 md:w-2/3 w-full mx-auto rounded-xl p-6">
        <div class="mb-10">
          <h1 class="text-2xl"><%= @title %></h1>
        </div>
        <div class="flex flex-col content-center justify-items-center w-full gap-6">
          <%= render_slot(@inner_block) %>
          <div class="text-center">
            <p>
              <%= if @title == "Sign Up" do %>
                <.card_footer__signup to={@to} />
              <% else %>
                <.card_footer__login to={@to} />
              <% end %>
            </p>
          </div>
        </div>
      </div>
    """
  end

  def card_footer__signup(assigns) do
    ~H"""
      Already have an account? <%= link "Login", to: @to, class: "text-button-color" %>
    """
  end

  def card_footer__login(assigns) do
    ~H"""
      Don't have an account? <%= link "Signup", to: @to, class: "text-button-color" %>
    """
  end
end

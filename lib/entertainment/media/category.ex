defmodule Entertainment.Media.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :category, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:category])
    |> validate_required([:category])
  end
end

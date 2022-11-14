defmodule Entertainment.Media.Video.Query do
  import Ecto.Query

  alias Entertainment.Media.Video

  def base() do
    Video
  end

  def single_video(id) do
    base() |> where([v], v.id == ^id)
  end
end

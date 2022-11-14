defmodule Entertainment.MediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Entertainment.Media` context.
  """

  @doc """
  Generate a video.
  """
  def video_fixture(attrs \\ %{}) do
    {:ok, video} =
      attrs
      |> Enum.into(%{
        is_trending: true,
        title: "some title",
        year: 42
      })
      |> Entertainment.Media.create_video()

    video
  end
end

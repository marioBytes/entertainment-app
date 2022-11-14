defmodule Entertainment.MediaTest do
  use Entertainment.DataCase

  alias Entertainment.Media

  describe "videos" do
    alias Entertainment.Media.Video

    import Entertainment.MediaFixtures

    @invalid_attrs %{is_trending: nil, title: nil, year: nil}

    test "list_videos/0 returns all videos" do
      video = video_fixture()
      assert Media.list_videos() == [video]
    end

    test "get_video!/1 returns the video with given id" do
      video = video_fixture()
      assert Media.get_video!(video.id) == video
    end

    test "create_video/1 with valid data creates a video" do
      valid_attrs = %{is_trending: true, title: "some title", year: 42}

      assert {:ok, %Video{} = video} = Media.create_video(valid_attrs)
      assert video.is_trending == true
      assert video.title == "some title"
      assert video.year == 42
    end

    test "create_video/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_video(@invalid_attrs)
    end

    test "update_video/2 with valid data updates the video" do
      video = video_fixture()
      update_attrs = %{is_trending: false, title: "some updated title", year: 43}

      assert {:ok, %Video{} = video} = Media.update_video(video, update_attrs)
      assert video.is_trending == false
      assert video.title == "some updated title"
      assert video.year == 43
    end

    test "update_video/2 with invalid data returns error changeset" do
      video = video_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_video(video, @invalid_attrs)
      assert video == Media.get_video!(video.id)
    end

    test "delete_video/1 deletes the video" do
      video = video_fixture()
      assert {:ok, %Video{}} = Media.delete_video(video)
      assert_raise Ecto.NoResultsError, fn -> Media.get_video!(video.id) end
    end

    test "change_video/1 returns a video changeset" do
      video = video_fixture()
      assert %Ecto.Changeset{} = Media.change_video(video)
    end
  end
end

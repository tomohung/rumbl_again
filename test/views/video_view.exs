defmodule RumblAgain.VideoViewTest do
  use RumblAgain.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%RumblAgain.Video{id: "1", title: "dogs"},
      %RumblAgain.Video{id: "2", title: "cats"}]
    content = render_to_string(RumblAgain.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = RumblAgain.Video.changeset(%RumblAgain.Video{})
    categories = [{"cats", 123}]
    content = render_to_string(RumblAgain.VideoView, "new.html", conn: conn, changeset: changeset, categories: categories)
    assert String.contains?(content, "New video")
  end
end

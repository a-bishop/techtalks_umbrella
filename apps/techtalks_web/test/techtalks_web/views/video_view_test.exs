defmodule TechtalksWeb.VideoViewTest do
  use TechtalksWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [
      %Techtalks.Multimedia.Video{id: "1", title: "dogs"},
      %Techtalks.Multimedia.Video{id: "2", title: "cats"}
    ]

    content =
      render_to_string(
        TechtalksWeb.VideoView,
        "index.html",
        conn: conn,
        videos: videos
      )

    assert String.contains?(content, "Listing Videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    # owner = %Techtalks.Accounts.User{}
    changeset = Techtalks.Multimedia.change_video(%Techtalks.Multimedia.Video{})
    categories = [%Techtalks.Multimedia.Category{id: 123, name: "cats"}]

    content =
      render_to_string(TechtalksWeb.VideoView, "new.html",
        conn: conn,
        changeset: changeset,
        categories: categories
      )

    assert String.contains?(content, "New Video")
  end
end

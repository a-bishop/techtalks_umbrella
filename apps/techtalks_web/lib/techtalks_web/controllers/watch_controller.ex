defmodule TechtalksWeb.WatchController do
  use TechtalksWeb, :controller
  alias Techtalks.Multimedia

  def show(conn, %{"id" => id}) do
    video = Multimedia.get_video!(id)
    render(conn, "show.html", video: video)
  end
end

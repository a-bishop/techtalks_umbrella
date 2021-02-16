defmodule TechtalksWeb.PageController do
  use TechtalksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

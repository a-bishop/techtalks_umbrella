defmodule TechtalksWeb.PageControllerTest do
  use TechtalksWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Techtalks!"
  end
end

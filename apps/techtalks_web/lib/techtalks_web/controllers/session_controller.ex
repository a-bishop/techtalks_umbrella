defmodule TechtalksWeb.SessionController do
  use TechtalksWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(
        conn,
        %{"session" => %{"username" => username, "password" => pass}}
      ) do
    case Techtalks.Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> TechtalksWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> TechtalksWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end

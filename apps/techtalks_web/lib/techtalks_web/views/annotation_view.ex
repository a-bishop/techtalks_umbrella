defmodule TechtalksWeb.AnnotationView do
  use TechtalksWeb, :view

  def render("annotation.json", %{annotation: annotation}) do
    %{
      id: annotation.id,
      body: annotation.body,
      at: annotation.at,
      user: render_one(annotation.user, TechtalksWeb.UserView, "user.json")
    }
  end
end

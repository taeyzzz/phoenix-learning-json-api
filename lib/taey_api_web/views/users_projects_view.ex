defmodule TaeyAPIWeb.UsersProjectsView do
  use TaeyAPIWeb, :view
  alias TaeyAPIWeb.UsersProjectsView

  def render("index.json", %{users_projects: users_projects}) do
    %{data: render_many(users_projects, UsersProjectsView, "users_projects.json")}
  end

  def render("show.json", %{users_projects: users_projects}) do
    %{data: render_one(users_projects, UsersProjectsView, "users_projects.json")}
  end

  def render("users_projects.json", %{users_projects: users_projects}) do
    %{id: users_projects.id}
  end
end

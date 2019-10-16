defmodule TaeyAPIWeb.UsersProjectsView do
  use TaeyAPIWeb, :view
  alias TaeyAPIWeb.UsersProjectsView
  alias TaeyAPIWeb.UserView
  alias TaeyAPIWeb.ProjectView

  def render("index.json", %{users_projects: users_projects}) do
    %{data: render_many(users_projects, UsersProjectsView, "users_projects.json")}
  end

  def render("show.json", %{users_projects: users_projects}) do
    %{data: render_one(users_projects, UsersProjectsView, "users_projects.json")}
  end

  def render("list_user_in_project.json", %{users: users}) do
    %{data: render_many(users, UserView, "user_with_role.json")}
  end

  def render("list_project_by_user.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("users_projects.json", %{users_projects: users_projects}) do
    users_projects |> IO.inspect
    %{}
  end
end

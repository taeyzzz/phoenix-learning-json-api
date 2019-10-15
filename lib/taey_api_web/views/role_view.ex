defmodule TaeyAPIWeb.RoleView do
  use TaeyAPIWeb, :view
  alias TaeyAPIWeb.RoleView
  alias TaeyAPIWeb.UserView

  def render("index.json", %{roles: roles}) do
    %{data: render_many(roles, RoleView, "role.json")}
  end

  def render("show.json", %{role: role}) do
    %{data: render_one(role, RoleView, "role_with_user.json")}
  end

  def render("role.json", %{role: role}) do
    %{id: role.id,
      name: role.name,
      description: role.description}
  end

  def render("role_with_user.json", %{role: role}) do
    %{
      id: role.id,
      name: role.name,
      description: role.description,
      users: render_many(role.users, UserView, "user.json")
    }
  end
end

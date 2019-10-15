defmodule TaeyAPIWeb.UserView do
  use TaeyAPIWeb, :view
  alias TaeyAPIWeb.UserView
  alias TaeyAPIWeb.RoleView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      role: render_one(user.role, RoleView, "role.json")
    }
  end
end

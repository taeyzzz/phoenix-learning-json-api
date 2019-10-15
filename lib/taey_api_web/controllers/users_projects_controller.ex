defmodule TaeyAPIWeb.UsersProjectsController do
  use TaeyAPIWeb, :controller

  alias TaeyAPI.Data
  alias TaeyAPI.Data.UsersProjects

  action_fallback TaeyAPIWeb.FallbackController

  def index(conn, _params) do
    users_projects = Data.list_users_projects()
    render(conn, "index.json", users_projects: users_projects)
  end

  def create(conn, %{"users_projects" => users_projects_params}) do
    with {:ok, %UsersProjects{} = users_projects} <- Data.create_users_projects(users_projects_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_projects_path(conn, :show, users_projects))
      |> render("show.json", users_projects: users_projects)
    end
  end

  def show(conn, %{"id" => id}) do
    users_projects = Data.get_users_projects!(id)
    render(conn, "show.json", users_projects: users_projects)
  end

  def update(conn, %{"id" => id, "users_projects" => users_projects_params}) do
    users_projects = Data.get_users_projects!(id)

    with {:ok, %UsersProjects{} = users_projects} <- Data.update_users_projects(users_projects, users_projects_params) do
      render(conn, "show.json", users_projects: users_projects)
    end
  end

  def delete(conn, %{"id" => id}) do
    users_projects = Data.get_users_projects!(id)

    with {:ok, %UsersProjects{}} <- Data.delete_users_projects(users_projects) do
      send_resp(conn, :no_content, "")
    end
  end
end

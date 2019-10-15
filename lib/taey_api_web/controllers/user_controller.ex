defmodule TaeyAPIWeb.UserController do
  use TaeyAPIWeb, :controller

  alias TaeyAPI.Auth
  alias TaeyAPI.Auth.User
  alias TaeyAPI.Repo

  action_fallback TaeyAPIWeb.FallbackController

  def index(conn, _params) do
    users = Auth.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Auth.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user |> Repo.preload([:role]))
    end
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Auth.get_user!(id)

    with {:ok, %User{} = user} <- Auth.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Auth.get_user!(id)

    with {:ok, %User{}} <- Auth.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def handle_login(conn, %{"email" => email, "password" => password}) do
    with %User{} = user <- Auth.authen_user(email, password) do
      conn
      |> put_session(:user_id, user.id)
      |> render("show.json", user: user)
    end
  end

  def handle_logout(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> send_resp(:no_content, "")
  end
end

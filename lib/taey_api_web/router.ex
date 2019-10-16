defmodule TaeyAPIWeb.Router do
  use TaeyAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :api_auth do
    plug :ensure_authenticated
  end

  scope "/api", TaeyAPIWeb do
    pipe_through :api
    post "/login", UserController, :handle_login
    post "/logout", UserController, :handle_logout
  end

  scope "/api", TaeyAPIWeb do
    pipe_through [:api, :api_auth]
    resources "/users", UserController
    resources "/roles", RoleController, only: [:index, :show, :update]
    resources "/projects", ProjectController
    get "/list-user/projects/:id", UsersProjectsController, :handle_list_user_in_project
  end

  defp ensure_authenticated(conn, _opts) do
    user_id = get_session(conn, :user_id)
    if user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> put_view(TaeyAPIWeb.ErrorView)
      |> render("401.json", message: "UnAuthorized.")
      |> halt()
    end
  end
end

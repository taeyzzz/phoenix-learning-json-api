defmodule TaeyAPIWeb.Router do
  use TaeyAPIWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TaeyAPIWeb do
    pipe_through :api
    resources "/users", UserController
  end
end

defmodule TaeyAPIWeb.UsersProjectsControllerTest do
  use TaeyAPIWeb.ConnCase

  alias TaeyAPI.Data
  alias TaeyAPI.Data.UsersProjects

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:users_projects) do
    {:ok, users_projects} = Data.create_users_projects(@create_attrs)
    users_projects
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users_projects", %{conn: conn} do
      conn = get(conn, Routes.users_projects_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create users_projects" do
    test "renders users_projects when data is valid", %{conn: conn} do
      conn = post(conn, Routes.users_projects_path(conn, :create), users_projects: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.users_projects_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.users_projects_path(conn, :create), users_projects: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update users_projects" do
    setup [:create_users_projects]

    test "renders users_projects when data is valid", %{conn: conn, users_projects: %UsersProjects{id: id} = users_projects} do
      conn = put(conn, Routes.users_projects_path(conn, :update, users_projects), users_projects: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.users_projects_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, users_projects: users_projects} do
      conn = put(conn, Routes.users_projects_path(conn, :update, users_projects), users_projects: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete users_projects" do
    setup [:create_users_projects]

    test "deletes chosen users_projects", %{conn: conn, users_projects: users_projects} do
      conn = delete(conn, Routes.users_projects_path(conn, :delete, users_projects))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.users_projects_path(conn, :show, users_projects))
      end
    end
  end

  defp create_users_projects(_) do
    users_projects = fixture(:users_projects)
    {:ok, users_projects: users_projects}
  end
end

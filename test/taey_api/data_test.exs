defmodule TaeyAPI.DataTest do
  use TaeyAPI.DataCase

  alias TaeyAPI.Data

  describe "projects" do
    alias TaeyAPI.Data.Project

    @valid_attrs %{name: "some name", price: 42}
    @update_attrs %{name: "some updated name", price: 43}
    @invalid_attrs %{name: nil, price: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Data.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Data.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Data.create_project(@valid_attrs)
      assert project.name == "some name"
      assert project.price == 42
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Data.update_project(project, @update_attrs)
      assert project.name == "some updated name"
      assert project.price == 43
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_project(project, @invalid_attrs)
      assert project == Data.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Data.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Data.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Data.change_project(project)
    end
  end

  describe "users_projects" do
    alias TaeyAPI.Data.UsersProjects

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def users_projects_fixture(attrs \\ %{}) do
      {:ok, users_projects} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_users_projects()

      users_projects
    end

    test "list_users_projects/0 returns all users_projects" do
      users_projects = users_projects_fixture()
      assert Data.list_users_projects() == [users_projects]
    end

    test "get_users_projects!/1 returns the users_projects with given id" do
      users_projects = users_projects_fixture()
      assert Data.get_users_projects!(users_projects.id) == users_projects
    end

    test "create_users_projects/1 with valid data creates a users_projects" do
      assert {:ok, %UsersProjects{} = users_projects} = Data.create_users_projects(@valid_attrs)
    end

    test "create_users_projects/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_users_projects(@invalid_attrs)
    end

    test "update_users_projects/2 with valid data updates the users_projects" do
      users_projects = users_projects_fixture()
      assert {:ok, %UsersProjects{} = users_projects} = Data.update_users_projects(users_projects, @update_attrs)
    end

    test "update_users_projects/2 with invalid data returns error changeset" do
      users_projects = users_projects_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_users_projects(users_projects, @invalid_attrs)
      assert users_projects == Data.get_users_projects!(users_projects.id)
    end

    test "delete_users_projects/1 deletes the users_projects" do
      users_projects = users_projects_fixture()
      assert {:ok, %UsersProjects{}} = Data.delete_users_projects(users_projects)
      assert_raise Ecto.NoResultsError, fn -> Data.get_users_projects!(users_projects.id) end
    end

    test "change_users_projects/1 returns a users_projects changeset" do
      users_projects = users_projects_fixture()
      assert %Ecto.Changeset{} = Data.change_users_projects(users_projects)
    end
  end
end

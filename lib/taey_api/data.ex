defmodule TaeyAPI.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias TaeyAPI.Repo

  alias TaeyAPI.Data.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end

  alias TaeyAPI.Data.UsersProjects

  @doc """
  Returns the list of users_projects.

  ## Examples

      iex> list_users_projects()
      [%UsersProjects{}, ...]

  """
  def list_users_projects do
    Repo.all(UsersProjects)
  end

  @doc """
  Gets a single users_projects.

  Raises `Ecto.NoResultsError` if the Users projects does not exist.

  ## Examples

      iex> get_users_projects!(123)
      %UsersProjects{}

      iex> get_users_projects!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users_projects!(id), do: Repo.get!(UsersProjects, id)

  def get_users_in_project(id) do
    query = from(up in UsersProjects, select: up, where: up.project_id == ^id)
    query
    |> Repo.all
    |> Repo.preload([user: [:role]])
    |> IO.inspect
  end

  @doc """
  Creates a users_projects.

  ## Examples

      iex> create_users_projects(%{field: value})
      {:ok, %UsersProjects{}}

      iex> create_users_projects(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users_projects(attrs \\ %{}) do
    %UsersProjects{}
    |> UsersProjects.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users_projects.

  ## Examples

      iex> update_users_projects(users_projects, %{field: new_value})
      {:ok, %UsersProjects{}}

      iex> update_users_projects(users_projects, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users_projects(%UsersProjects{} = users_projects, attrs) do
    users_projects
    |> UsersProjects.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UsersProjects.

  ## Examples

      iex> delete_users_projects(users_projects)
      {:ok, %UsersProjects{}}

      iex> delete_users_projects(users_projects)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users_projects(%UsersProjects{} = users_projects) do
    Repo.delete(users_projects)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users_projects changes.

  ## Examples

      iex> change_users_projects(users_projects)
      %Ecto.Changeset{source: %UsersProjects{}}

  """
  def change_users_projects(%UsersProjects{} = users_projects) do
    UsersProjects.changeset(users_projects, %{})
  end
end

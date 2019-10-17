defmodule TaeyAPI.Data.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaeyAPI.Auth.User
  alias TaeyAPI.Data.UsersProjects

  schema "projects" do
    field :name, :string
    field :price, :integer
    many_to_many :users, User, join_through: UsersProjects, on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
    |> unique_constraint(:name)
  end

  @doc false
  def changeset_add_user_to_project(project, users) do
    project
    |> cast(%{}, [:name, :price])
    |> validate_required([:name, :price])
    |> put_assoc(:users, users)
  end
end

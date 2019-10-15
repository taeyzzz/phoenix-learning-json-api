defmodule TaeyAPI.Data.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaeyAPI.Auth.User

  schema "projects" do
    field :name, :string
    field :price, :integer
    many_to_many :users, User, join_through: "users_projects", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
    |> unique_constraint(:name)
  end
end

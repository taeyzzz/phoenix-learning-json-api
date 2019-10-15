defmodule TaeyAPI.Auth.Role do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaeyAPI.Auth.User

  schema "roles" do
    field :description, :string
    field :name, :string
    has_many :users, User

    timestamps()
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end

  @doc false
  def update_description_changeset(role, attrs) do
    role
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end

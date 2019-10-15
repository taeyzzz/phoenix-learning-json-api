defmodule TaeyAPI.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaeyAPI.Auth.Role
  alias TaeyAPI.Auth.Project

  schema "users" do
    field :email, :string
    field :password, :string
    field :first_name, :string
    field :last_name, :string
    belongs_to :role, Role, foreign_key: :role_id
    many_to_many :projects, Project, join_through: "users_projects", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :first_name, :last_name, :role_id])
    |> validate_required([:email, :password, :first_name, :last_name, :role_id])
    |> unique_constraint(:email)
  end

  @doc false
  def update_user_detail_changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :role_id])
    |> validate_required([:email, :password, :first_name, :last_name, :role_id])
  end
end

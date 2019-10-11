defmodule TaeyAPI.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string
    field :first_name, :string
    field :last_name, :string
    belongs_to :role, Role

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :first_name, :last_name, :role])
    |> validate_required([:email, :password, :first_name, :last_name, :role])
    |> unique_constraint(:email)
  end
end

defmodule TaeyAPI.Data.UsersProjects do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaeyAPI.Auth.User
  alias TaeyAPI.Data.Project

  @primary_key false
  schema "users_projects" do
    belongs_to :user, User, primary_key: true
    belongs_to :project, Project, primary_key: true

    timestamps()
  end

  @doc false
  def changeset(users_projects, attrs) do
    users_projects
    |> cast(attrs, [:user_id, :project_id])
    |> validate_required([:user_id, :project_id])
    |> foreign_key_constraint(:project_id)
    |> foreign_key_constraint(:user_id)
    # |> unique_constraint([:user, :project],
    #   name: :user_id_project_id_unique_index,
    #   message: "Already exist"
    # )
  end
end

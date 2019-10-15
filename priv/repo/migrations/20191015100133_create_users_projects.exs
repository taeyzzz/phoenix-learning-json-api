defmodule TaeyAPI.Repo.Migrations.CreateUsersProjects do
  use Ecto.Migration

  def change do
    create table(:users_projects, primary_key: false) do
      add :user_id, references(:users, on_delete: :delete_all), primary_key: true
      add :project_id, references(:projects, on_delete: :delete_all), primary_key: true

      timestamps()
    end

    create(index(:users_projects, [:project_id]))
    create(index(:users_projects, [:user_id]))

    create(
      unique_index(:users_projects, [:user_id, :project_id], name: :user_id_project_id_unique_index)
    )
  end
end

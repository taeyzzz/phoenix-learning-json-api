defmodule TaeyAPI.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password, :string
      add :first_name, :string
      add :last_name, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end

  end
end

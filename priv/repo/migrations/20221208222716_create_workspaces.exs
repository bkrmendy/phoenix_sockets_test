defmodule HelloSockets.Repo.Migrations.CreateWorkspaces do
  use Ecto.Migration

  def change do
    create table(:workspaces, primary_key: false) do
      add :id, :string, primary_key: true
      add :created_at, :bigint
      add :updated_at, :bigint
      add :deleted, :boolean
    end
  end
end

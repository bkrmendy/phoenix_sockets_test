defmodule HelloSockets.Repo.Migrations.CreateThreads do
  use Ecto.Migration

  def change do
    create table(:threads, primary_key: false) do
      add :id, :string, primary_key: true
      add :created_at, :bigint
      add :resolved, :boolean
      add :updated_at, :bigint
      add :author_id, :string
      add :workspace_id, :string
      add :canvas_coords, :string
      add :deleted, :boolean
    end
  end
end

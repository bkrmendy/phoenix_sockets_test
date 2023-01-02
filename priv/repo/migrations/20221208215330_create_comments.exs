defmodule HelloSockets.Repo.Migrations.CreateComments do
  use Ecto.Migration
  @disable_ddl_transaction true

  def change do
    create table(:comments, primary_key: false) do
      add :id, :string, primary_key: true
      add :created_at, :bigint
      add :updated_at, :bigint
      add :author_id, :string
      add :deleted, :boolean
      add :thread_id, :string
      add :workspace_id, :string
      add :content, :string
    end

    create index(:comments, [:thread_id]) # TODO: should be concurrent but apparently this is against the grain
    create index(:comments, [:workspace_id]) # TODO: should be concurrent but apparently this is against the grain
  end
end

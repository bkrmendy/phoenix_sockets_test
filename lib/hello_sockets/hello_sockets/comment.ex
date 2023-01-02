defmodule HelloSockets.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :created_at, :updated_at, :author_id, :deleted, :thread_id, :workspace_id, :content]}
  @primary_key false
  schema "comments" do
    field :id, :string, primary_key: true
    field :workspace_id, :string
    field :created_at, :integer
    field :updated_at, :integer
    field :author_id, :string
    field :thread_id, :string
    field :deleted, :boolean
    field :content, :string
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:id, :created_at, :updated_at, :author_id, :deleted, :thread_id, :workspace_id, :content])
    |> validate_required([:id, :created_at, :updated_at, :author_id, :deleted, :thread_id, :workspace_id, :content])
  end
end

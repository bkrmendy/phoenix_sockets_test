defmodule HelloSockets.Workspaces do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "workspaces" do
    field :id, :string, primary_key: true
    field :created_at, :integer
    field :deleted, :boolean
    field :updated_at, :integer
  end

  @doc false
  def changeset(workspaces, attrs) do
    workspaces
    |> cast(attrs, [:id, :created_at, :updated_at, :deleted])
    |> validate_required([:id, :created_at, :updated_at, :deleted])
  end
end

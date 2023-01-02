defmodule HelloSockets.Thread do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [
             :id,
             :created_at,
             :updated_at,
             :author_id,
             :workspace_id,
             :deleted,
             :resolved,
             :canvas_coords
           ]}
  @primary_key false
  schema "threads" do
    field(:id, :string, primary_key: true)
    field(:created_at, :integer)
    field(:updated_at, :integer)
    field(:author_id, :string)
    field(:workspace_id, :string)
    field(:deleted, :boolean)
    field(:resolved, :boolean)
    field(:canvas_coords, :string)
  end

  @doc false
  def changeset(thread, attrs) do
    thread
    |> cast(attrs, [
      :id,
      :created_at,
      :updated_at,
      :author_id,
      :workspace_id,
      :deleted,
      :resolved,
      :canvas_coords
    ])
    |> validate_required([
      :id,
      :created_at,
      :updated_at,
      :author_id,
      :workspace_id,
      :deleted,
      :resolved,
      :canvas_coords
    ])
  end
end

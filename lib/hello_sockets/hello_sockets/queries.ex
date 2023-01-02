import Ecto.Query

defmodule HelloSockets.HelloSockets.Queries do
  alias HelloSockets.Thread
  alias HelloSockets.Comment

  # read
  @spec comments_since(String.t(), number()) :: any
  def comments_since(workspace, since) do
    HelloSockets.Repo.all(
      from(p in Comment, where: p.workspace_id == ^workspace and p.updated_at > ^since, select: p)
    )
  end

  @spec threads_since(String.t(), number()) :: any
  def threads_since(workspace, since) do
    HelloSockets.Repo.all(
      from(t in Thread, where: t.workspace_id == ^workspace and t.updated_at > ^since, select: t)
    )
  end

  # upsert
  def upsert_thread(data) do
    thread = %Thread{} |> Thread.changeset(data)

    HelloSockets.Repo.insert!(
      thread,
      on_conflict: :replace_all,
      conflict_target: :id
    )

    thread
  end

  def upsert_comment(data) do
    comment = %Comment{} |> Comment.changeset(data)

    HelloSockets.Repo.insert!(
      comment,
      on_conflict: :replace_all,
      conflict_target: :id
    )

    comment
  end

  # debug
  def all() do
    HelloSockets.Repo.all(from(p in Comment, select: p))
  end
end

import Ecto.Query

defmodule HelloSockets.HelloSockets.Queries do
  alias HelloSockets.Thread
  alias HelloSockets.Comment

  # read

  @spec comments_for_workspace(String.t) :: any
  def comments_for_workspace(workspace_id) do
    HelloSockets.Repo.all(from p in Comment, where: p.workspace_id == ^workspace_id, select: p)
  end

  @spec threads_for_workspace(String.t) :: any
  def threads_for_workspace(workspace_id) do
    HelloSockets.Repo.all(from thread in Thread, where: thread.workspace_id == ^workspace_id, select: thread)
  end

  # create

  def create_thread(data) do
    thread = %Thread{} |> Thread.changeset(data)
    HelloSockets.Repo.insert!(thread)
    thread
  end

  def create_comment(data) do
    comment = %Comment{} |> Comment.changeset(data)
    HelloSockets.Repo.insert!(comment)
    comment
  end



  # update

  def resolve_thread(workspace_id, thread_id, resolved_status) do
    from(thread in Thread, where: thread.id == ^thread_id and thread.workspace_id == ^workspace_id, select: thread)
    |> HelloSockets.Repo.update_all(set: [resolved: resolved_status])
    %{ :workspace_id => workspace_id, :thread_id => thread_id, :resolved => resolved_status }
  end

  def delete_comment(workspace_id, comment_id, deleted_status) do
    from(comment in Comment, where: comment.id == ^comment_id and comment.workspace_id == ^workspace_id, select: comment)
    |> HelloSockets.Repo.update_all(set: [deleted: deleted_status])
    %{ :workspace_id => workspace_id, :comment_id => comment_id, :deleted_status => deleted_status }
  end

  # rest

  def all() do
    HelloSockets.Repo.all(from p in Comment, select: p)
  end

  @spec comments_since(String.t(), number()) :: any
  def comments_since(workspace, since) do
    HelloSockets.Repo.all(from p in Comment, where: p.workspace_id == ^workspace and p.updated_at > ^since, select: p)
  end

  @spec threads_since(String.t(), number()) :: any
  def threads_since(workspace, since) do
    HelloSockets.Repo.all(from t in Thread, where: t.workspace_id == ^workspace and t.updated_at > ^since, select: t)
  end
end

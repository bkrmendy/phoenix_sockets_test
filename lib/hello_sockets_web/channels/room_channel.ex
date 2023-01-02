defmodule HelloSocketsWeb.RoomChannel do
  use Phoenix.Channel
  alias HelloSocketsWeb.Protocol
  alias HelloSockets.HelloSockets.Queries

  def join("room:lobby", socket) do
    {:ok, socket}
  end

  def join("room:" <> _room_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    comments = Protocol.comments_from_messages(body)
    threads = Protocol.threads_from_message(body)

    for t <- threads, do: Queries.upsert_thread(t)
    for c <- comments, do: Queries.upsert_comment(c)

    broadcast!(socket, "new_msg", %{body: body})
    {:noreply, socket}
  end

  def handle_in("refresh", %{"timestamp" => timestamp, "workspace_id" => workspace_id}, socket) do
    comments =
      Queries.comments_since(workspace_id, timestamp)
      |> Protocol.comments_to_message()

    threads =
      Queries.threads_since(workspace_id, timestamp)
      |> Protocol.threads_to_message()

    {:reply, {:ok, %{"body" => threads ++ comments}}, socket}
  end
end

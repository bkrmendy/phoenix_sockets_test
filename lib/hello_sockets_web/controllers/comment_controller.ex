defmodule HelloSocketsWeb.CommentController do
  use HelloSocketsWeb, :controller
  alias HelloSockets.HelloSockets.Queries

  def create(conn, _params) do
    _ = Queries.create_comment(conn.body_params)
    json(conn, conn.body_params)
  end

  def all(conn, _params) do
    comments = Queries.all()
    json(conn, comments)
  end

  def since(conn, %{ "since" => since }) do
    comments = Queries.since(since)
    json(conn, comments)
  end
end

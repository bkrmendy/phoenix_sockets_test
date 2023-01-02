defmodule HelloSocketsWeb.PageController do
  use HelloSocketsWeb, :controller

  def index(conn, _params) do
    json(conn, %{})
  end
end

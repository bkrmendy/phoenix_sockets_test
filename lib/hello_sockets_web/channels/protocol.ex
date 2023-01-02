defmodule HelloSocketsWeb.Protocol do
  def threads_from_message(messages) do
    for %{ "type" => type, "body" => body } <- messages, type === "THREAD_DATA", do: body
  end

  def comments_from_messages(messages) do
    for %{ "type" => type, "body" => body } <- messages, type === "COMMENT_DATA", do: body
  end

  def threads_to_message(threads) do
    threads |> Enum.map(fn t -> %{ "type" => "THREAD_DATA", "body" => t } end)
  end

  def comments_to_message(comments) do
    comments |> Enum.map(fn c -> %{ "type" => "COMMENT_DATA", "body" => c } end)
  end
end

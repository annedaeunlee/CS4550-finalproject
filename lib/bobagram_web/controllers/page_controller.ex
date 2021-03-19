defmodule BobagramWeb.PageController do
  use BobagramWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

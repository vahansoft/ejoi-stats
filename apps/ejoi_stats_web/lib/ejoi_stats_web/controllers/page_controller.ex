defmodule EjoiStatsWeb.PageController do
  use EjoiStatsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

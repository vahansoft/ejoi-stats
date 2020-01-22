defmodule EjoiStatsWeb.OlympiadController do
  use EjoiStatsWeb, :controller

  alias EjoiStats.Stats
  alias EjoiStats.Stats.Olympiad

  action_fallback EjoiStatsWeb.FallbackController

  def index(conn, _params) do
    olympiads = Stats.list_olympiads()
    render(conn, "index.json", olympiads: olympiads)
  end

  def create(conn, %{"olympiad" => olympiad_params}) do
    with {:ok, %Olympiad{} = olympiad} <- Stats.create_olympiad(olympiad_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.olympiad_path(conn, :show, olympiad))
      |> render("show.json", olympiad: olympiad)
    end
  end

  def show(conn, %{"id" => id}) do
    olympiad = Stats.get_olympiad!(id)
    render(conn, "show.json", olympiad: olympiad)
  end

  def update(conn, %{"id" => id, "olympiad" => olympiad_params}) do
    olympiad = Stats.get_olympiad!(id)

    with {:ok, %Olympiad{} = olympiad} <- Stats.update_olympiad(olympiad, olympiad_params) do
      render(conn, "show.json", olympiad: olympiad)
    end
  end

  def delete(conn, %{"id" => id}) do
    olympiad = Stats.get_olympiad!(id)

    with {:ok, %Olympiad{}} <- Stats.delete_olympiad(olympiad) do
      send_resp(conn, :no_content, "")
    end
  end
end

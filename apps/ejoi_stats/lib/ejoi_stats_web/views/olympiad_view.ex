defmodule EjoiStatsWeb.OlympiadView do
  use EjoiStatsWeb, :view
  alias EjoiStatsWeb.OlympiadView

  def render("index.json", %{olympiads: olympiads}) do
    %{data: render_many(olympiads, OlympiadView, "olympiad.json")}
  end

  def render("show.json", %{olympiad: olympiad}) do
    %{data: render_one(olympiad, OlympiadView, "olympiad.json")}
  end

  def render("olympiad.json", %{olympiad: olympiad}) do
    %{id: olympiad.id,
      name: olympiad.name,
      start_date: olympiad.start_date,
      host_country: olympiad.host_country}
  end
end

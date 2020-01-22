defmodule EjoiStats.Repo do
  use Ecto.Repo,
    otp_app: :ejoi_stats,
    adapter: Ecto.Adapters.Postgres
end

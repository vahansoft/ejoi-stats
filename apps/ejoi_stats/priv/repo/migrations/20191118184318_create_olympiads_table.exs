defmodule EjoiStats.Repo.Migrations.CreateOlympiadsTable do
  use Ecto.Migration

  def change do
    create table(:olympiads) do
      add :name,       :string
      add :start_date, :date
      add :end_date, :date
      add :host_country, :string
      add :host_city, :string
      add :website_url, :string
      add :logo_url, :string
      timestamps()
    end
  end
end

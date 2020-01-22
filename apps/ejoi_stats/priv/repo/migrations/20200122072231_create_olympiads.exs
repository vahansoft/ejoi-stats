defmodule EjoiStats.Repo.Migrations.CreateOlympiads do
  use Ecto.Migration

  def change do
    create table(:olympiads) do
      add :name, :string
      add :start_date, :date
      add :host_country, :string

      timestamps()
    end

  end
end

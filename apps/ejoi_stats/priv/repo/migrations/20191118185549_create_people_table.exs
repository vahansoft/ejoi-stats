defmodule EjoiStats.Repo.Migrations.CreatePeopleTable do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :first_name, :string
      add :last_name, :string
      add :country, :string
      add :birthday, :date
      add :social_info, :map

      timestamps()
    end
  end
end

defmodule EjoiStats.Repo.Migrations.CreateOlympiadsParticipantsTable do
  use Ecto.Migration

  def change do
    create table(:olympad_participants) do
      add :olympiad_id, :integer
      add :role_id, :integer
      add :person_id, :integer
      add :medal_id, :integer

      timestamps()
    end
  end
end

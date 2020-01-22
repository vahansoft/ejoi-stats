defmodule EjoiStats.Repo.Migrations.CreateTasksTable do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :olympiad_id, :integer
      add :title, :string
      add :description, :text
      add :max_score, :integer

      timestamps()
    end
  end
end

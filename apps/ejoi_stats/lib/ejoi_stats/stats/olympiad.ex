defmodule EjoiStats.Stats.Olympiad do
  use Ecto.Schema
  import Ecto.Changeset

  schema "olympiads" do
    field :host_country, :string
    field :name, :string
    field :start_date, :date

    timestamps()
  end

  @doc false
  def changeset(olympiad, attrs) do
    olympiad
    |> cast(attrs, [:name, :start_date, :host_country])
    |> validate_required([:name, :start_date, :host_country])
  end
end

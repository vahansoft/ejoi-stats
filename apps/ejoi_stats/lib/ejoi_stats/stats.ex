defmodule EjoiStats.Stats do
  @moduledoc """
  The Stats context.
  """

  import Ecto.Query, warn: false
  alias EjoiStats.Repo

  alias EjoiStats.Stats.Olympiad

  @doc """
  Returns the list of olympiads.

  ## Examples

      iex> list_olympiads()
      [%Olympiad{}, ...]

  """
  def list_olympiads do
    Repo.all(Olympiad)
  end

  @doc """
  Gets a single olympiad.

  Raises `Ecto.NoResultsError` if the Olympiad does not exist.

  ## Examples

      iex> get_olympiad!(123)
      %Olympiad{}

      iex> get_olympiad!(456)
      ** (Ecto.NoResultsError)

  """
  def get_olympiad!(id), do: Repo.get!(Olympiad, id)

  @doc """
  Creates a olympiad.

  ## Examples

      iex> create_olympiad(%{field: value})
      {:ok, %Olympiad{}}

      iex> create_olympiad(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_olympiad(attrs \\ %{}) do
    %Olympiad{}
    |> Olympiad.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a olympiad.

  ## Examples

      iex> update_olympiad(olympiad, %{field: new_value})
      {:ok, %Olympiad{}}

      iex> update_olympiad(olympiad, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_olympiad(%Olympiad{} = olympiad, attrs) do
    olympiad
    |> Olympiad.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Olympiad.

  ## Examples

      iex> delete_olympiad(olympiad)
      {:ok, %Olympiad{}}

      iex> delete_olympiad(olympiad)
      {:error, %Ecto.Changeset{}}

  """
  def delete_olympiad(%Olympiad{} = olympiad) do
    Repo.delete(olympiad)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking olympiad changes.

  ## Examples

      iex> change_olympiad(olympiad)
      %Ecto.Changeset{source: %Olympiad{}}

  """
  def change_olympiad(%Olympiad{} = olympiad) do
    Olympiad.changeset(olympiad, %{})
  end
end

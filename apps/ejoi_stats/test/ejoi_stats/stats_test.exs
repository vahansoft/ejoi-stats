defmodule EjoiStats.StatsTest do
  use EjoiStats.DataCase

  alias EjoiStats.Stats

  describe "olympiads" do
    alias EjoiStats.Stats.Olympiad

    @valid_attrs %{host_country: "some host_country", name: "some name", start_date: ~D[2010-04-17]}
    @update_attrs %{host_country: "some updated host_country", name: "some updated name", start_date: ~D[2011-05-18]}
    @invalid_attrs %{host_country: nil, name: nil, start_date: nil}

    def olympiad_fixture(attrs \\ %{}) do
      {:ok, olympiad} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stats.create_olympiad()

      olympiad
    end

    test "list_olympiads/0 returns all olympiads" do
      olympiad = olympiad_fixture()
      assert Stats.list_olympiads() == [olympiad]
    end

    test "get_olympiad!/1 returns the olympiad with given id" do
      olympiad = olympiad_fixture()
      assert Stats.get_olympiad!(olympiad.id) == olympiad
    end

    test "create_olympiad/1 with valid data creates a olympiad" do
      assert {:ok, %Olympiad{} = olympiad} = Stats.create_olympiad(@valid_attrs)
      assert olympiad.host_country == "some host_country"
      assert olympiad.name == "some name"
      assert olympiad.start_date == ~D[2010-04-17]
    end

    test "create_olympiad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stats.create_olympiad(@invalid_attrs)
    end

    test "update_olympiad/2 with valid data updates the olympiad" do
      olympiad = olympiad_fixture()
      assert {:ok, %Olympiad{} = olympiad} = Stats.update_olympiad(olympiad, @update_attrs)
      assert olympiad.host_country == "some updated host_country"
      assert olympiad.name == "some updated name"
      assert olympiad.start_date == ~D[2011-05-18]
    end

    test "update_olympiad/2 with invalid data returns error changeset" do
      olympiad = olympiad_fixture()
      assert {:error, %Ecto.Changeset{}} = Stats.update_olympiad(olympiad, @invalid_attrs)
      assert olympiad == Stats.get_olympiad!(olympiad.id)
    end

    test "delete_olympiad/1 deletes the olympiad" do
      olympiad = olympiad_fixture()
      assert {:ok, %Olympiad{}} = Stats.delete_olympiad(olympiad)
      assert_raise Ecto.NoResultsError, fn -> Stats.get_olympiad!(olympiad.id) end
    end

    test "change_olympiad/1 returns a olympiad changeset" do
      olympiad = olympiad_fixture()
      assert %Ecto.Changeset{} = Stats.change_olympiad(olympiad)
    end
  end
end

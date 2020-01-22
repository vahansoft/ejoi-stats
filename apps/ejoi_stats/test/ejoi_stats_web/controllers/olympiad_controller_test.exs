defmodule EjoiStatsWeb.OlympiadControllerTest do
  use EjoiStatsWeb.ConnCase

  alias EjoiStats.Stats
  alias EjoiStats.Stats.Olympiad

  @create_attrs %{
    host_country: "some host_country",
    name: "some name",
    start_date: ~D[2010-04-17]
  }
  @update_attrs %{
    host_country: "some updated host_country",
    name: "some updated name",
    start_date: ~D[2011-05-18]
  }
  @invalid_attrs %{host_country: nil, name: nil, start_date: nil}

  def fixture(:olympiad) do
    {:ok, olympiad} = Stats.create_olympiad(@create_attrs)
    olympiad
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all olympiads", %{conn: conn} do
      conn = get(conn, Routes.olympiad_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create olympiad" do
    test "renders olympiad when data is valid", %{conn: conn} do
      conn = post(conn, Routes.olympiad_path(conn, :create), olympiad: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.olympiad_path(conn, :show, id))

      assert %{
               "id" => id,
               "host_country" => "some host_country",
               "name" => "some name",
               "start_date" => "2010-04-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.olympiad_path(conn, :create), olympiad: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update olympiad" do
    setup [:create_olympiad]

    test "renders olympiad when data is valid", %{conn: conn, olympiad: %Olympiad{id: id} = olympiad} do
      conn = put(conn, Routes.olympiad_path(conn, :update, olympiad), olympiad: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.olympiad_path(conn, :show, id))

      assert %{
               "id" => id,
               "host_country" => "some updated host_country",
               "name" => "some updated name",
               "start_date" => "2011-05-18"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, olympiad: olympiad} do
      conn = put(conn, Routes.olympiad_path(conn, :update, olympiad), olympiad: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete olympiad" do
    setup [:create_olympiad]

    test "deletes chosen olympiad", %{conn: conn, olympiad: olympiad} do
      conn = delete(conn, Routes.olympiad_path(conn, :delete, olympiad))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.olympiad_path(conn, :show, olympiad))
      end
    end
  end

  defp create_olympiad(_) do
    olympiad = fixture(:olympiad)
    {:ok, olympiad: olympiad}
  end
end

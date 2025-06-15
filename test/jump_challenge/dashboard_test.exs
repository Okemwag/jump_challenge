defmodule JumpChallenge.DashboardTest do
  use JumpChallenge.DataCase

  alias JumpChallenge.Dashboard

  describe "homes" do
    alias JumpChallenge.Dashboard.Home

    import JumpChallenge.DashboardFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_homes/0 returns all homes" do
      home = home_fixture()
      assert Dashboard.list_homes() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Dashboard.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Home{} = home} = Dashboard.create_home(valid_attrs)
      assert home.description == "some description"
      assert home.title == "some title"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Home{} = home} = Dashboard.update_home(home, update_attrs)
      assert home.description == "some updated description"
      assert home.title == "some updated title"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_home(home, @invalid_attrs)
      assert home == Dashboard.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Dashboard.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_home(home)
    end
  end
end

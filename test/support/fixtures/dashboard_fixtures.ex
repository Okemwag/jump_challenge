defmodule JumpChallenge.DashboardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JumpChallenge.Dashboard` context.
  """

  @doc """
  Generate a home.
  """
  def home_fixture(attrs \\ %{}) do
    {:ok, home} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> JumpChallenge.Dashboard.create_home()

    home
  end
end

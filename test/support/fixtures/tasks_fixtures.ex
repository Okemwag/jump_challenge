defmodule JumpChallenge.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JumpChallenge.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        metadata: %{},
        scheduled_for: ~U[2025-06-14 17:29:00Z],
        status: "some status",
        task_type: "some task_type",
        title: "some title"
      })
      |> JumpChallenge.Tasks.create_task()

    task
  end
end

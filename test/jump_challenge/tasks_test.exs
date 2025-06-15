defmodule JumpChallenge.TasksTest do
  use JumpChallenge.DataCase

  alias JumpChallenge.Tasks

  describe "tasks" do
    alias JumpChallenge.Tasks.Task

    import JumpChallenge.TasksFixtures

    @invalid_attrs %{status: nil, description: nil, title: nil, metadata: nil, task_type: nil, scheduled_for: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{status: "some status", description: "some description", title: "some title", metadata: %{}, task_type: "some task_type", scheduled_for: ~U[2025-06-14 17:29:00Z]}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
      assert task.status == "some status"
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.metadata == %{}
      assert task.task_type == "some task_type"
      assert task.scheduled_for == ~U[2025-06-14 17:29:00Z]
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{status: "some updated status", description: "some updated description", title: "some updated title", metadata: %{}, task_type: "some updated task_type", scheduled_for: ~U[2025-06-15 17:29:00Z]}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
      assert task.status == "some updated status"
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.metadata == %{}
      assert task.task_type == "some updated task_type"
      assert task.scheduled_for == ~U[2025-06-15 17:29:00Z]
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end

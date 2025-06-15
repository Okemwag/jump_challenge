defmodule JumpChallenge.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :status, :string
    field :description, :string
    field :title, :string
    field :metadata, :map
    field :task_type, :string
    field :scheduled_for, :utc_datetime
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :status, :task_type, :scheduled_for, :metadata])
    |> validate_required([:title, :description, :status, :task_type, :scheduled_for])
  end
end

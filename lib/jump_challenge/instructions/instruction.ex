defmodule JumpChallenge.Instructions.Instruction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "instructions" do
    field :action, :string
    field :trigger, :string
    field :conditions, :map
    field :is_active, :boolean, default: false
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(instruction, attrs) do
    instruction
    |> cast(attrs, [:trigger, :action, :conditions, :is_active])
    |> validate_required([:trigger, :action, :is_active])
  end
end

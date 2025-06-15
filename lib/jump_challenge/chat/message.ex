defmodule JumpChallenge.Chat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :metadata, :map
    field :role, :string
    field :content, :string
    field :inserted_at, :utc_datetime
    field :user_id, :id


  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :role, :metadata, :inserted_at])
    |> validate_required([:content, :role, :inserted_at])
  end
end

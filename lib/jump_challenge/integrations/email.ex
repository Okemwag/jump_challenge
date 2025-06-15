defmodule JumpChallenge.Integrations.Email do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pgvector.Ecto.Vector

  schema "emails" do
    field :body, :string
    field :gmail_id, :string
    field :subject, :string
    field :sender, :string
    field :recipient, :string
    field :received_at, :utc_datetime
    field :user_id, :id
    field :embedding, Vector

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(email, attrs) do
    email
    |> cast(attrs, [:gmail_id, :subject, :body, :sender, :recipient, :received_at])
    |> validate_required([:gmail_id, :subject, :body, :sender, :recipient, :received_at])
  end
end

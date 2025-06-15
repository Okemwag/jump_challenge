defmodule JumpChallenge.Integrations.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pgvector.Ecto.Vector

  schema "contacts" do
    field :hubspot_id, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :company, :string
    field :notes, :string
    field :user_id, :id
    field :embedding, Vector

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:hubspot_id, :first_name, :last_name, :email, :company, :notes])
    |> validate_required([:hubspot_id, :first_name, :last_name, :email, :company, :notes])
  end
end

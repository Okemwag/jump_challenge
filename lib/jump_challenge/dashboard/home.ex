defmodule JumpChallenge.Dashboard.Home do
  use Ecto.Schema
  import Ecto.Changeset

  schema "homes" do
    field :description, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(home, attrs) do
    home
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end

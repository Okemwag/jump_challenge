defmodule JumpChallenge.Integrations.CalendarEvent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calendar_events" do
    field :description, :string
    field :title, :string
    field :google_event_id, :string
    field :start_time, :utc_datetime
    field :end_time, :utc_datetime
    field :attendees, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(calendar_event, attrs) do
    calendar_event
    |> cast(attrs, [:google_event_id, :title, :description, :start_time, :end_time, :attendees])
    |> validate_required([:google_event_id, :title, :description, :start_time, :end_time, :attendees])
  end
end

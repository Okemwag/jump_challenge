defmodule JumpChallenge.Repo.Migrations.CreateCalendarEvents do
  use Ecto.Migration

  def change do
    create table(:calendar_events) do
      add :google_event_id, :string
      add :title, :string
      add :description, :text
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :attendees, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:calendar_events, [:user_id])
  end
end

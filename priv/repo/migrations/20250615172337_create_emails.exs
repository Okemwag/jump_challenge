defmodule JumpChallenge.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :gmail_id, :string
      add :subject, :string
      add :body, :text
      add :sender, :string
      add :recipient, :string
      add :received_at, :utc_datetime
      add :embedding, :vector, size: 384
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:emails, [:user_id])
  end
end

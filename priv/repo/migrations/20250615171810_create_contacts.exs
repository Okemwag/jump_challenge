defmodule JumpChallenge.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :hubspot_id, :string
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :company, :string
      add :notes, :text
      add :embedding, :vector, size: 384
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:contacts, [:user_id])
  end
end

defmodule JumpChallenge.Repo.Migrations.CreateInstructions do
  use Ecto.Migration

  def change do
    create table(:instructions) do
      add :trigger, :string
      add :action, :string
      add :conditions, :map
      add :is_active, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:instructions, [:user_id])
  end
end

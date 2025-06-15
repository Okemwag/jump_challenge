defmodule JumpChallenge.Repo.Migrations.CreateHomes do
  use Ecto.Migration

  def change do
    create table(:homes) do
      add :title, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end

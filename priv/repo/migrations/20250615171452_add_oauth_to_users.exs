defmodule JumpChallenge.Repo.Migrations.AddOauthToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :google_id, :string
      add :google_access_token, :text
      add :google_refresh_token, :text
      add :hubspot_access_token, :text
      add :hubspot_refresh_token, :text
      add :hubspot_portal_id, :string
    end

    create unique_index(:users, [:google_id])
  end
end

defmodule JumpChallenge.Repo do
  use Ecto.Repo,
    otp_app: :jump_challenge,
    adapter: Ecto.Adapters.Postgres
end

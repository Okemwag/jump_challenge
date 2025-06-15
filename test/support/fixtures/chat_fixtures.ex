defmodule JumpChallenge.ChatFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JumpChallenge.Chat` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        content: "some content",
        inserted_at: ~U[2025-06-14 17:30:00Z],
        metadata: %{},
        role: "some role"
      })
      |> JumpChallenge.Chat.create_message()

    message
  end
end

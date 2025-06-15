defmodule JumpChallenge.InstructionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JumpChallenge.Instructions` context.
  """

  @doc """
  Generate a instruction.
  """
  def instruction_fixture(attrs \\ %{}) do
    {:ok, instruction} =
      attrs
      |> Enum.into(%{
        action: "some action",
        conditions: %{},
        is_active: true,
        trigger: "some trigger"
      })
      |> JumpChallenge.Instructions.create_instruction()

    instruction
  end
end

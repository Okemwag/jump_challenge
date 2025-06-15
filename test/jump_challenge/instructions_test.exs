defmodule JumpChallenge.InstructionsTest do
  use JumpChallenge.DataCase

  alias JumpChallenge.Instructions

  describe "instructions" do
    alias JumpChallenge.Instructions.Instruction

    import JumpChallenge.InstructionsFixtures

    @invalid_attrs %{action: nil, trigger: nil, conditions: nil, is_active: nil}

    test "list_instructions/0 returns all instructions" do
      instruction = instruction_fixture()
      assert Instructions.list_instructions() == [instruction]
    end

    test "get_instruction!/1 returns the instruction with given id" do
      instruction = instruction_fixture()
      assert Instructions.get_instruction!(instruction.id) == instruction
    end

    test "create_instruction/1 with valid data creates a instruction" do
      valid_attrs = %{action: "some action", trigger: "some trigger", conditions: %{}, is_active: true}

      assert {:ok, %Instruction{} = instruction} = Instructions.create_instruction(valid_attrs)
      assert instruction.action == "some action"
      assert instruction.trigger == "some trigger"
      assert instruction.conditions == %{}
      assert instruction.is_active == true
    end

    test "create_instruction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instructions.create_instruction(@invalid_attrs)
    end

    test "update_instruction/2 with valid data updates the instruction" do
      instruction = instruction_fixture()
      update_attrs = %{action: "some updated action", trigger: "some updated trigger", conditions: %{}, is_active: false}

      assert {:ok, %Instruction{} = instruction} = Instructions.update_instruction(instruction, update_attrs)
      assert instruction.action == "some updated action"
      assert instruction.trigger == "some updated trigger"
      assert instruction.conditions == %{}
      assert instruction.is_active == false
    end

    test "update_instruction/2 with invalid data returns error changeset" do
      instruction = instruction_fixture()
      assert {:error, %Ecto.Changeset{}} = Instructions.update_instruction(instruction, @invalid_attrs)
      assert instruction == Instructions.get_instruction!(instruction.id)
    end

    test "delete_instruction/1 deletes the instruction" do
      instruction = instruction_fixture()
      assert {:ok, %Instruction{}} = Instructions.delete_instruction(instruction)
      assert_raise Ecto.NoResultsError, fn -> Instructions.get_instruction!(instruction.id) end
    end

    test "change_instruction/1 returns a instruction changeset" do
      instruction = instruction_fixture()
      assert %Ecto.Changeset{} = Instructions.change_instruction(instruction)
    end
  end
end

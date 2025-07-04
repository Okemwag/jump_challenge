defmodule JumpChallenge.ChatTest do
  use JumpChallenge.DataCase

  alias JumpChallenge.Chat

  describe "messages" do
    alias JumpChallenge.Chat.Message

    import JumpChallenge.ChatFixtures

    @invalid_attrs %{metadata: nil, role: nil, content: nil, inserted_at: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Chat.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Chat.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{metadata: %{}, role: "some role", content: "some content", inserted_at: ~U[2025-06-14 17:30:00Z]}

      assert {:ok, %Message{} = message} = Chat.create_message(valid_attrs)
      assert message.metadata == %{}
      assert message.role == "some role"
      assert message.content == "some content"
      assert message.inserted_at == ~U[2025-06-14 17:30:00Z]
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chat.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      update_attrs = %{metadata: %{}, role: "some updated role", content: "some updated content", inserted_at: ~U[2025-06-15 17:30:00Z]}

      assert {:ok, %Message{} = message} = Chat.update_message(message, update_attrs)
      assert message.metadata == %{}
      assert message.role == "some updated role"
      assert message.content == "some updated content"
      assert message.inserted_at == ~U[2025-06-15 17:30:00Z]
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Chat.update_message(message, @invalid_attrs)
      assert message == Chat.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Chat.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Chat.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Chat.change_message(message)
    end
  end
end

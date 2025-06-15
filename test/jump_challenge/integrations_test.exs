defmodule JumpChallenge.IntegrationsTest do
  use JumpChallenge.DataCase

  alias JumpChallenge.Integrations

  describe "calendar_events" do
    alias JumpChallenge.Integrations.CalendarEvent

    import JumpChallenge.IntegrationsFixtures

    @invalid_attrs %{description: nil, title: nil, google_event_id: nil, start_time: nil, end_time: nil, attendees: nil}

    test "list_calendar_events/0 returns all calendar_events" do
      calendar_event = calendar_event_fixture()
      assert Integrations.list_calendar_events() == [calendar_event]
    end

    test "get_calendar_event!/1 returns the calendar_event with given id" do
      calendar_event = calendar_event_fixture()
      assert Integrations.get_calendar_event!(calendar_event.id) == calendar_event
    end

    test "create_calendar_event/1 with valid data creates a calendar_event" do
      valid_attrs = %{description: "some description", title: "some title", google_event_id: "some google_event_id", start_time: ~U[2025-06-14 17:15:00Z], end_time: ~U[2025-06-14 17:15:00Z], attendees: "some attendees"}

      assert {:ok, %CalendarEvent{} = calendar_event} = Integrations.create_calendar_event(valid_attrs)
      assert calendar_event.description == "some description"
      assert calendar_event.title == "some title"
      assert calendar_event.google_event_id == "some google_event_id"
      assert calendar_event.start_time == ~U[2025-06-14 17:15:00Z]
      assert calendar_event.end_time == ~U[2025-06-14 17:15:00Z]
      assert calendar_event.attendees == "some attendees"
    end

    test "create_calendar_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Integrations.create_calendar_event(@invalid_attrs)
    end

    test "update_calendar_event/2 with valid data updates the calendar_event" do
      calendar_event = calendar_event_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", google_event_id: "some updated google_event_id", start_time: ~U[2025-06-15 17:15:00Z], end_time: ~U[2025-06-15 17:15:00Z], attendees: "some updated attendees"}

      assert {:ok, %CalendarEvent{} = calendar_event} = Integrations.update_calendar_event(calendar_event, update_attrs)
      assert calendar_event.description == "some updated description"
      assert calendar_event.title == "some updated title"
      assert calendar_event.google_event_id == "some updated google_event_id"
      assert calendar_event.start_time == ~U[2025-06-15 17:15:00Z]
      assert calendar_event.end_time == ~U[2025-06-15 17:15:00Z]
      assert calendar_event.attendees == "some updated attendees"
    end

    test "update_calendar_event/2 with invalid data returns error changeset" do
      calendar_event = calendar_event_fixture()
      assert {:error, %Ecto.Changeset{}} = Integrations.update_calendar_event(calendar_event, @invalid_attrs)
      assert calendar_event == Integrations.get_calendar_event!(calendar_event.id)
    end

    test "delete_calendar_event/1 deletes the calendar_event" do
      calendar_event = calendar_event_fixture()
      assert {:ok, %CalendarEvent{}} = Integrations.delete_calendar_event(calendar_event)
      assert_raise Ecto.NoResultsError, fn -> Integrations.get_calendar_event!(calendar_event.id) end
    end

    test "change_calendar_event/1 returns a calendar_event changeset" do
      calendar_event = calendar_event_fixture()
      assert %Ecto.Changeset{} = Integrations.change_calendar_event(calendar_event)
    end
  end

  describe "calendar_events" do
    alias JumpChallenge.Integrations.CalendarEvent

    import JumpChallenge.IntegrationsFixtures

    @invalid_attrs %{description: nil, title: nil, google_event_id: nil, start_time: nil, end_time: nil, attendees: nil}

    test "list_calendar_events/0 returns all calendar_events" do
      calendar_event = calendar_event_fixture()
      assert Integrations.list_calendar_events() == [calendar_event]
    end

    test "get_calendar_event!/1 returns the calendar_event with given id" do
      calendar_event = calendar_event_fixture()
      assert Integrations.get_calendar_event!(calendar_event.id) == calendar_event
    end

    test "create_calendar_event/1 with valid data creates a calendar_event" do
      valid_attrs = %{description: "some description", title: "some title", google_event_id: "some google_event_id", start_time: ~U[2025-06-14 17:16:00Z], end_time: ~U[2025-06-14 17:16:00Z], attendees: "some attendees"}

      assert {:ok, %CalendarEvent{} = calendar_event} = Integrations.create_calendar_event(valid_attrs)
      assert calendar_event.description == "some description"
      assert calendar_event.title == "some title"
      assert calendar_event.google_event_id == "some google_event_id"
      assert calendar_event.start_time == ~U[2025-06-14 17:16:00Z]
      assert calendar_event.end_time == ~U[2025-06-14 17:16:00Z]
      assert calendar_event.attendees == "some attendees"
    end

    test "create_calendar_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Integrations.create_calendar_event(@invalid_attrs)
    end

    test "update_calendar_event/2 with valid data updates the calendar_event" do
      calendar_event = calendar_event_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title", google_event_id: "some updated google_event_id", start_time: ~U[2025-06-15 17:16:00Z], end_time: ~U[2025-06-15 17:16:00Z], attendees: "some updated attendees"}

      assert {:ok, %CalendarEvent{} = calendar_event} = Integrations.update_calendar_event(calendar_event, update_attrs)
      assert calendar_event.description == "some updated description"
      assert calendar_event.title == "some updated title"
      assert calendar_event.google_event_id == "some updated google_event_id"
      assert calendar_event.start_time == ~U[2025-06-15 17:16:00Z]
      assert calendar_event.end_time == ~U[2025-06-15 17:16:00Z]
      assert calendar_event.attendees == "some updated attendees"
    end

    test "update_calendar_event/2 with invalid data returns error changeset" do
      calendar_event = calendar_event_fixture()
      assert {:error, %Ecto.Changeset{}} = Integrations.update_calendar_event(calendar_event, @invalid_attrs)
      assert calendar_event == Integrations.get_calendar_event!(calendar_event.id)
    end

    test "delete_calendar_event/1 deletes the calendar_event" do
      calendar_event = calendar_event_fixture()
      assert {:ok, %CalendarEvent{}} = Integrations.delete_calendar_event(calendar_event)
      assert_raise Ecto.NoResultsError, fn -> Integrations.get_calendar_event!(calendar_event.id) end
    end

    test "change_calendar_event/1 returns a calendar_event changeset" do
      calendar_event = calendar_event_fixture()
      assert %Ecto.Changeset{} = Integrations.change_calendar_event(calendar_event)
    end
  end

  describe "contacts" do
    alias JumpChallenge.Integrations.Contact

    import JumpChallenge.IntegrationsFixtures

    @invalid_attrs %{hubspot_id: nil, first_name: nil, last_name: nil, email: nil, company: nil, notes: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Integrations.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Integrations.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      valid_attrs = %{hubspot_id: "some hubspot_id", first_name: "some first_name", last_name: "some last_name", email: "some email", company: "some company", notes: "some notes"}

      assert {:ok, %Contact{} = contact} = Integrations.create_contact(valid_attrs)
      assert contact.hubspot_id == "some hubspot_id"
      assert contact.first_name == "some first_name"
      assert contact.last_name == "some last_name"
      assert contact.email == "some email"
      assert contact.company == "some company"
      assert contact.notes == "some notes"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Integrations.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      update_attrs = %{hubspot_id: "some updated hubspot_id", first_name: "some updated first_name", last_name: "some updated last_name", email: "some updated email", company: "some updated company", notes: "some updated notes"}

      assert {:ok, %Contact{} = contact} = Integrations.update_contact(contact, update_attrs)
      assert contact.hubspot_id == "some updated hubspot_id"
      assert contact.first_name == "some updated first_name"
      assert contact.last_name == "some updated last_name"
      assert contact.email == "some updated email"
      assert contact.company == "some updated company"
      assert contact.notes == "some updated notes"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Integrations.update_contact(contact, @invalid_attrs)
      assert contact == Integrations.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Integrations.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Integrations.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Integrations.change_contact(contact)
    end
  end

  describe "emails" do
    alias JumpChallenge.Integrations.Email

    import JumpChallenge.IntegrationsFixtures

    @invalid_attrs %{body: nil, gmail_id: nil, subject: nil, sender: nil, recipient: nil, received_at: nil}

    test "list_emails/0 returns all emails" do
      email = email_fixture()
      assert Integrations.list_emails() == [email]
    end

    test "get_email!/1 returns the email with given id" do
      email = email_fixture()
      assert Integrations.get_email!(email.id) == email
    end

    test "create_email/1 with valid data creates a email" do
      valid_attrs = %{body: "some body", gmail_id: "some gmail_id", subject: "some subject", sender: "some sender", recipient: "some recipient", received_at: ~U[2025-06-14 17:23:00Z]}

      assert {:ok, %Email{} = email} = Integrations.create_email(valid_attrs)
      assert email.body == "some body"
      assert email.gmail_id == "some gmail_id"
      assert email.subject == "some subject"
      assert email.sender == "some sender"
      assert email.recipient == "some recipient"
      assert email.received_at == ~U[2025-06-14 17:23:00Z]
    end

    test "create_email/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Integrations.create_email(@invalid_attrs)
    end

    test "update_email/2 with valid data updates the email" do
      email = email_fixture()
      update_attrs = %{body: "some updated body", gmail_id: "some updated gmail_id", subject: "some updated subject", sender: "some updated sender", recipient: "some updated recipient", received_at: ~U[2025-06-15 17:23:00Z]}

      assert {:ok, %Email{} = email} = Integrations.update_email(email, update_attrs)
      assert email.body == "some updated body"
      assert email.gmail_id == "some updated gmail_id"
      assert email.subject == "some updated subject"
      assert email.sender == "some updated sender"
      assert email.recipient == "some updated recipient"
      assert email.received_at == ~U[2025-06-15 17:23:00Z]
    end

    test "update_email/2 with invalid data returns error changeset" do
      email = email_fixture()
      assert {:error, %Ecto.Changeset{}} = Integrations.update_email(email, @invalid_attrs)
      assert email == Integrations.get_email!(email.id)
    end

    test "delete_email/1 deletes the email" do
      email = email_fixture()
      assert {:ok, %Email{}} = Integrations.delete_email(email)
      assert_raise Ecto.NoResultsError, fn -> Integrations.get_email!(email.id) end
    end

    test "change_email/1 returns a email changeset" do
      email = email_fixture()
      assert %Ecto.Changeset{} = Integrations.change_email(email)
    end
  end
end

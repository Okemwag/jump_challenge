defmodule JumpChallenge.IntegrationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `JumpChallenge.Integrations` context.
  """

  @doc """
  Generate a calendar_event.
  """
  def calendar_event_fixture(attrs \\ %{}) do
    {:ok, calendar_event} =
      attrs
      |> Enum.into(%{
        attendees: "some attendees",
        description: "some description",
        end_time: ~U[2025-06-14 17:15:00Z],
        google_event_id: "some google_event_id",
        start_time: ~U[2025-06-14 17:15:00Z],
        title: "some title"
      })
      |> JumpChallenge.Integrations.create_calendar_event()

    calendar_event
  end

  @doc """
  Generate a calendar_event.
  """
  def calendar_event_fixture(attrs \\ %{}) do
    {:ok, calendar_event} =
      attrs
      |> Enum.into(%{
        attendees: "some attendees",
        description: "some description",
        end_time: ~U[2025-06-14 17:16:00Z],
        google_event_id: "some google_event_id",
        start_time: ~U[2025-06-14 17:16:00Z],
        title: "some title"
      })
      |> JumpChallenge.Integrations.create_calendar_event()

    calendar_event
  end

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        company: "some company",
        email: "some email",
        first_name: "some first_name",
        hubspot_id: "some hubspot_id",
        last_name: "some last_name",
        notes: "some notes"
      })
      |> JumpChallenge.Integrations.create_contact()

    contact
  end

  @doc """
  Generate a email.
  """
  def email_fixture(attrs \\ %{}) do
    {:ok, email} =
      attrs
      |> Enum.into(%{
        body: "some body",
        gmail_id: "some gmail_id",
        received_at: ~U[2025-06-14 17:23:00Z],
        recipient: "some recipient",
        sender: "some sender",
        subject: "some subject"
      })
      |> JumpChallenge.Integrations.create_email()

    email
  end
end

defmodule JumpChallengeWeb.HomeLive.Index do
  use JumpChallengeWeb, :live_view

  alias JumpChallenge.Dashboard
  alias JumpChallenge.Dashboard.Home

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :home_collection, Dashboard.list_home())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Home")
    |> assign(:home, Dashboard.get_home!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Home")
    |> assign(:home, %Home{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Home")
    |> assign(:home, nil)
  end

  @impl true
  def handle_info({JumpChallengeWeb.HomeLive.FormComponent, {:saved, home}}, socket) do
    {:noreply, stream_insert(socket, :home_collection, home)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    home = Dashboard.get_home!(id)
    {:ok, _} = Dashboard.delete_home(home)

    {:noreply, stream_delete(socket, :home_collection, home)}
  end
end

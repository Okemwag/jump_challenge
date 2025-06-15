defmodule JumpChallengeWeb.HomeLive.Show do
  use JumpChallengeWeb, :live_view

  alias JumpChallenge.Dashboard

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:home, Dashboard.get_home!(id))}
  end

  defp page_title(:show), do: "Show Home"
  defp page_title(:edit), do: "Edit Home"
end

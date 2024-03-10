defmodule PhxOtpInputWeb.Demo do
  use PhxOtpInputWeb, :live_view

  import PhxOtpInput

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket |> assign(form: to_form(%{}))

    {:ok, socket}
  end
end

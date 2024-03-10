defmodule PhxOtpInput do
  use Phoenix.Component

  alias PhxOtpInput.Component

  @moduledoc ~S"""
  The `PhxOtpInput` component is rendered by calling the `otp_input/1` function and passing it a form field.
  """

  def otp_input(assigns) do
    assigns =
      assigns |> assign(module: PhxOtpInput.Component)

    ~H"""
    <.live_component {assigns} />
    """
  end
end

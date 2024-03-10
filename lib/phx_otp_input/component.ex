defmodule PhxOtpInput.Component do
  use Phoenix.LiveComponent

  import PhoenixHTMLHelpers.Form,
    only: [text_input: 3, hidden_input: 3]

  def render(assigns) do
    ~L"""
    <div class="phx-otp-input">
      <input type="text" name="otp" />
    </div>
    """
  end
end

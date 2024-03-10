defmodule PhxOtpInput.Component do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="phx-otp-input">
      <input type="text" name="otp" />
    </div>
    """
  end
end

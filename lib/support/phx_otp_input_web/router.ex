defmodule PhxOtpInputWeb.Router do
  use PhxOtpInputWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PhxOtpInputWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers, %{"content-security-policy" => "default-src 'self'"}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhxOtpInputWeb do
    pipe_through :browser

    live "/", Demo
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhxOtpInputWeb do
  #   pipe_through :api
  # end
end

defmodule RumblAgain.Router do
  use RumblAgain.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug RumblAgain.Auth, repo: RumblAgain.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RumblAgain do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    resources "/videos", VideoController
  end

  scope "/manage", RumblAgain do
    pipe_through [:browser, :authenticate_user]
    resources "/videos", VideoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RumblAgain do
  #   pipe_through :api
  # end
end

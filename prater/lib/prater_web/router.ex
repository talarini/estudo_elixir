defmodule PraterWeb.Router do
  use PraterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PraterWeb do
    pipe_through :browser

    get "/", RoomController, :index

    resources "/rooms", RoomController
    # get "/rooms/new", RoomController, :new
    # post "/rooms", RoomController, :create
    # get "/rooms/:id", RoomController, :show
    # get "/rooms/:id/edit", RoomController, :edit
    # put "/rooms/:id", RoomController, :update
    # delete "/rooms/:id", RoomController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", PraterWeb do
  #   pipe_through :api
  # end
end

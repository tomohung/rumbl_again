defmodule RumblAgain.UserController do
  use RumblAgain.Web, :controller

  def index(conn, _params) do
    users = Repo.all(RumblAgain.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(RumblAgain.User, id)
    render conn, "show.html", user: user
  end
end

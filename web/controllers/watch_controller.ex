defmodule RumblAgain.WatchController do
  use RumblAgain.Web, :controller
  alias RumblAgain.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end

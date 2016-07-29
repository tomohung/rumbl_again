defmodule RumblAgain.UserView do
  use RumblAgain.Web, :view
  alias RumblAgain.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end

defmodule RumblAgain.TestHelpers do
  alias RumblAgain.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
      password: "supersecret"
    }, attrs)

    %RumblAgain.User{}
    |> RumblAgain.User.registration_changeset(changes)
    |> Repo.insert!()

  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.build_assoc(:videos, attrs)
    |> Repo.insert()
  end
end

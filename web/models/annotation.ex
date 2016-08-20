defmodule RumblAgain.Annotation do
  use RumblAgain.Web, :model

  schema "annotations" do
    field :body, :string
    field :at, :integer
    belongs_to :user, RumblAgain.User
    belongs_to :video, RumblAgain.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :at])
    |> validate_required([:body, :at])
  end
end

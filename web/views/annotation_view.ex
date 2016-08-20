defmodule RumblAgain.AnnotationView do
  use RumblAgain.Web, :view

  def render("annotation.json", %{annotation: ann}) do
    %{
      id: ann.id,
      body: ann.body,
      at: ann.at,
      user: render_one(ann.user, RumblAgain.UserView, "user.json")
    }
  end
end

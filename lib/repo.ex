defmodule CowboyEx.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://nicholasf:@localhost/test"
  end

  def priv do
    app_dir(:cowboy_ex, "priv/repo")
  end
end

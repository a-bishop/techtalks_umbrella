defmodule Techtalks.Repo do
  use Ecto.Repo,
    otp_app: :techtalks,
    adapter: Ecto.Adapters.Postgres
end

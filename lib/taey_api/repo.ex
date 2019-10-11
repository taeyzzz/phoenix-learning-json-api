defmodule TaeyAPI.Repo do
  use Ecto.Repo,
    otp_app: :taey_api,
    adapter: Ecto.Adapters.Postgres
end

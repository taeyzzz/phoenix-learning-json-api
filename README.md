# TaeyAPI

# Prerequisite
- Install Elixir https://elixir-lang.org/install.html
- Install Phoenix framework https://hexdocs.pm/phoenix/installation.html#content

## In this learning. I use docker postgres
```bash
docker run --name learn-postgres -p 5432:5432 -d postgres

docker run -p 80:80 \
        -e "PGADMIN_DEFAULT_EMAIL=admin" \
        -e "PGADMIN_DEFAULT_PASSWORD=password" \
        --link learn-postgres:learn-postgres \
        -d dpage/pgadmin4

```

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

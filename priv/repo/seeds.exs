# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Entertainment.Repo.insert!(%Entertainment.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Entertainment.Accounts

test_users = [
  %{
    email: "user@ent.io",
    password: "12345678"
  },
  %{
    email: "mario@ent.io",
    password: "12345678"
  },
  %{
    email: "test_user@ent.io",
    password: "12345678"
  },
  %{
    email: "alice@ent.io",
    password: "12345678"
  },
  %{
    email: "admin@ent.io",
    password: "12345678"
  },
  %{
    email: "dev@ent.io",
    password: "12345678"
  },
  %{
    email: "support@ent.io",
    password: "12345678"
  },
  %{
    email: "dan@ent.io",
    password: "12345678"
  },
]

Enum.each(test_users, fn user -> Accounts.register_user(user) end)

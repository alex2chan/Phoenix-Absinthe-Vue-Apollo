# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hello.Repo.insert!(%Hello.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Hello.Accounts

Accounts.create_user(%{
  name: "Kim Chae Won",
  description: "Radish Angel",
  age: 19
})

Accounts.create_user(%{
  name: "Jo Yuri",
  description: "Jo Glass",
  age: 18
})

Accounts.create_user(%{
  name: "Kang Hyewon",
  description: "Deathbringer",
  age: 20
})

Accounts.create_user(%{
  name: "Choi Yena",
  description: "Duckling",
  age: 20
})

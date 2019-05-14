# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Api.Repo.insert!(%Api.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule Api.DatabaseSeeder do
  alias Api.Repo
  alias Api.Events.Event
  alias FakerElixir, as: Faker

  def insert_event do
    Repo.insert!(%Event{
      title: Faker.Lorem.words(2..4),
      description: Faker.Lorem.sentences(3..5),
      date:
        Faker.Date.forward(10)
        |> DateTime.from_iso8601()
        |> elem(1)
        |> DateTime.to_date()
    })
  end

  def clear do
    Repo.delete_all()
  end
end

1..1000 |> Enum.each(fn _ -> Api.DatabaseSeeder.insert_event() end)

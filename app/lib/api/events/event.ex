defmodule Api.Events.Event do
  @moduledoc """
  The Events Schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :date, :date
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :date])
    |> validate_required([:title, :description, :date])
  end
end

defmodule Bobagram.Photos.Photo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "photos" do
    field :boba_drink_name, :string
    field :boba_place_name, :string
    field :date_posted, :naive_datetime
    field :photo, :string
    field :review, :string

    field :comment, :string
    field :like, :string

    belongs_to :user, Events.Users.User
    belongs_to :post, Events.Posts.Post


    timestamps()
  end

  @doc false
  def changeset(photo, attrs) do
    photo
    |> cast(attrs, [:date_posted, :boba_place_name, :boba_drink_name, :review, :photo])
    |> validate_required([:date_posted, :boba_place_name, :boba_drink_name, :review, :photo])
  end
end

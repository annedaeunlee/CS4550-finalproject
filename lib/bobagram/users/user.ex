defmodule Bobagram.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :bio, :string
    field :email, :string
    field :name, :string
    field :profile_pic, :string


    #field :geolocation, :location (acccording to API)
    #field :favorites, :text (or string?)

    has_many :photos, Bobagram.Photos.Photo
    #photo acts similarly to invite from events app


    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :profile_pic, :bio])
    |> validate_required([:name, :email, :profile_pic, :bio])
    |> unique_constraint(:email)
  end
end

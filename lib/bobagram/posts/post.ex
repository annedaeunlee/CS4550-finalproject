defmodule Bobagram.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :affordability, :integer
    field :name, :string
    field :contact_info, :string
    field :hours_open, :string
    field :photo, :string
    field :proximity, :float
    field :specialty, :string
    field :wifi_avail, :boolean, default: false

    has_many :photos, Bobagram.Photos.Photo

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:date_posted, :boba_place, :drink_name, :specialty, :wifi_avail, :affordability, :proximity, :photo, :hours_open, :contact_info])
    |> validate_required([:date_posted, :boba_place, :drink_name, :specialty, :wifi_avail, :affordability, :proximity, :photo, :hours_open, :contact_info])
  end
end

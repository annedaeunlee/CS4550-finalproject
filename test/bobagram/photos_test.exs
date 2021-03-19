defmodule Bobagram.PhotosTest do
  use Bobagram.DataCase

  alias Bobagram.Photos

  describe "photos" do
    alias Bobagram.Photos.Photo

    @valid_attrs %{boba_drink_name: "some boba_drink_name", boba_place_name: "some boba_place_name", date_posted: ~N[2010-04-17 14:00:00], photo: "some photo", review: "some review"}
    @update_attrs %{boba_drink_name: "some updated boba_drink_name", boba_place_name: "some updated boba_place_name", date_posted: ~N[2011-05-18 15:01:01], photo: "some updated photo", review: "some updated review"}
    @invalid_attrs %{boba_drink_name: nil, boba_place_name: nil, date_posted: nil, photo: nil, review: nil}

    def photo_fixture(attrs \\ %{}) do
      {:ok, photo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Photos.create_photo()

      photo
    end

    test "list_photos/0 returns all photos" do
      photo = photo_fixture()
      assert Photos.list_photos() == [photo]
    end

    test "get_photo!/1 returns the photo with given id" do
      photo = photo_fixture()
      assert Photos.get_photo!(photo.id) == photo
    end

    test "create_photo/1 with valid data creates a photo" do
      assert {:ok, %Photo{} = photo} = Photos.create_photo(@valid_attrs)
      assert photo.boba_drink_name == "some boba_drink_name"
      assert photo.boba_place_name == "some boba_place_name"
      assert photo.date_posted == ~N[2010-04-17 14:00:00]
      assert photo.photo == "some photo"
      assert photo.review == "some review"
    end

    test "create_photo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Photos.create_photo(@invalid_attrs)
    end

    test "update_photo/2 with valid data updates the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{} = photo} = Photos.update_photo(photo, @update_attrs)
      assert photo.boba_drink_name == "some updated boba_drink_name"
      assert photo.boba_place_name == "some updated boba_place_name"
      assert photo.date_posted == ~N[2011-05-18 15:01:01]
      assert photo.photo == "some updated photo"
      assert photo.review == "some updated review"
    end

    test "update_photo/2 with invalid data returns error changeset" do
      photo = photo_fixture()
      assert {:error, %Ecto.Changeset{}} = Photos.update_photo(photo, @invalid_attrs)
      assert photo == Photos.get_photo!(photo.id)
    end

    test "delete_photo/1 deletes the photo" do
      photo = photo_fixture()
      assert {:ok, %Photo{}} = Photos.delete_photo(photo)
      assert_raise Ecto.NoResultsError, fn -> Photos.get_photo!(photo.id) end
    end

    test "change_photo/1 returns a photo changeset" do
      photo = photo_fixture()
      assert %Ecto.Changeset{} = Photos.change_photo(photo)
    end
  end
end

defmodule Bobagram.PostsTest do
  use Bobagram.DataCase

  alias Bobagram.Posts

  describe "posts" do
    alias Bobagram.Posts.Post

    @valid_attrs %{affordability: 42, boba_place: "some boba_place", contact_info: "some contact_info", date_posted: ~N[2010-04-17 14:00:00], drink_name: "some drink_name", hours_open: "some hours_open", photo: "some photo", proximity: 120.5, specialty: "some specialty", wifi_avail: true}
    @update_attrs %{affordability: 43, boba_place: "some updated boba_place", contact_info: "some updated contact_info", date_posted: ~N[2011-05-18 15:01:01], drink_name: "some updated drink_name", hours_open: "some updated hours_open", photo: "some updated photo", proximity: 456.7, specialty: "some updated specialty", wifi_avail: false}
    @invalid_attrs %{affordability: nil, boba_place: nil, contact_info: nil, date_posted: nil, drink_name: nil, hours_open: nil, photo: nil, proximity: nil, specialty: nil, wifi_avail: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Posts.create_post(@valid_attrs)
      assert post.affordability == 42
      assert post.boba_place == "some boba_place"
      assert post.contact_info == "some contact_info"
      assert post.date_posted == ~N[2010-04-17 14:00:00]
      assert post.drink_name == "some drink_name"
      assert post.hours_open == "some hours_open"
      assert post.photo == "some photo"
      assert post.proximity == 120.5
      assert post.specialty == "some specialty"
      assert post.wifi_avail == true
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Posts.update_post(post, @update_attrs)
      assert post.affordability == 43
      assert post.boba_place == "some updated boba_place"
      assert post.contact_info == "some updated contact_info"
      assert post.date_posted == ~N[2011-05-18 15:01:01]
      assert post.drink_name == "some updated drink_name"
      assert post.hours_open == "some updated hours_open"
      assert post.photo == "some updated photo"
      assert post.proximity == 456.7
      assert post.specialty == "some updated specialty"
      assert post.wifi_avail == false
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end

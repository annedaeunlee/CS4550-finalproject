defmodule Bobagram.Repo.Migrations.CreatePhotos do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :date_posted, :naive_datetime
      add :boba_place_name, :string
      add :boba_drink_name, :string
      add :review, :string
      add :photo, :text

      add :post_id, references(:posts), null: false
      add :user_id, references(:users), null: false
      add :comment, :string, null: false 
      add :like, :string, null: false

      timestamps()
    end

    create unique_index(:photos, [:post_id, :user_id])

  end
end

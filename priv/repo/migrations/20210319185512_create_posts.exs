defmodule Bobagram.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string, null: false
      add :specialty, :string, null: false
      add :wifi_avail, :boolean, default: false, null: false
      add :affordability, :integer, null: false
      add :proximity, :float, null: false
      add :photo, :text, null: false
      add :hours_open, :string, null: false
      add :contact_info, :string, null: false

      timestamps()
    end

  end
end

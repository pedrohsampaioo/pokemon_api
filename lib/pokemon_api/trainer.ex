defmodule PokemonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  @required_params [:name, :password]

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> add_password_hash()
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    changeset
    |> change(Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end

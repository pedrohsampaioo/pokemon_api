defmodule PokemonApi.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "trainers" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  def build(params, action, trainer \\ %__MODULE__{}) do
    params
    |> changeset(trainer)
    |> apply_action(action)
  end

  @required_params [:name, :password]

  def changeset(params, trainer \\ %__MODULE__{}) do
    trainer
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end

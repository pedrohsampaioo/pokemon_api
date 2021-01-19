defmodule PokemonApi.Trainer.Delete do
  alias Ecto.UUID
  alias PokemonApi.{Repo, Trainer}

  def call(id) do
    id
    |> uuid_valid?()
  end

  defp uuid_valid?(uuid) do
    uuid
    |> UUID.cast()
    |> handle_uuid_cast_result()
  end

  defp handle_uuid_cast_result(:error), do: {:error, "It is not a valid UUID"}

  defp handle_uuid_cast_result({:ok, uuid}), do: delete_trainer(uuid)

  def delete_trainer(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> Repo.delete(trainer)
    end
  end
end

defmodule PokemonApi.Trainer.Delete do
  alias Ecto.UUID
  alias PokemonApi.{Repo, Trainer}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "It's not a valid UUID"}
      {:ok, _uuid} -> delete(uuid)
    end
  end

  defp delete(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> Repo.delete(trainer)
    end
  end
end

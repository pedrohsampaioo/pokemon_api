defmodule PokemonApi.Trainer.Get do
  alias Ecto.UUID
  alias PokemonApi.{Repo, Trainer}

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "It's not a valid UUID"}
      {:ok, _uuid} -> get_trainer(uuid)
    end
  end

  defp get_trainer(uuid) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> {:ok, trainer}
    end
  end
end

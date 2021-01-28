defmodule PokemonApi.Trainer.Update do
  alias Ecto.UUID
  alias PokemonApi.{Repo, Trainer}

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "It's not a valid UUID"}
      {:ok, _uuid} -> get_trainer(params)
    end
  end

  defp get_trainer(%{"id" => uuid} = params) do
    case Repo.get(Trainer, uuid) do
      nil -> {:error, "Trainer not found"}
      trainer -> update_trainer(trainer, params)
    end
  end

  defp update_trainer(trainer, params) do
    params
    |> Trainer.changeset(trainer)
    |> Repo.update()
  end
end

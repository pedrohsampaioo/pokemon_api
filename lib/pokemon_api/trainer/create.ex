defmodule PokemonApi.Trainer.Create do
  alias PokemonApi.{Trainer, Repo}

  def call(params) do
    params
    |> Trainer.build(:insert)
    |> insert_into_database()
  end

  defp insert_into_database({:ok, changeset}) do
    Repo.insert(changeset)
  end

  defp insert_into_database({:error, _changeset} = error), do: error
end

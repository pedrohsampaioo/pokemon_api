defmodule PokemonApi do
  alias PokemonApi.Trainer
  defdelegate create_trainer(params), to: Trainer.Create, as: :call
  defdelegate delete_trainer(uuid), to: Trainer.Delete, as: :call
  defdelegate get_trainer(uuid), to: Trainer.Get, as: :call
  defdelegate update_trainer(params), to: Trainer.Update, as: :call
end

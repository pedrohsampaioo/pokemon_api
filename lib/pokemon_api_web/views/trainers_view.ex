defmodule PokemonApiWeb.TrainersView do
  use PokemonApiWeb, :view
  alias PokemonApi.Trainer

  def render("get_trainer.json", %{
        trainer: %Trainer{id: id, inserted_at: inserted_at, updated_at: updated_at, name: name}
      }) do
    %{
      data: %{
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
    }
  end

  def render("create_trainer.json", %{
        trainer: %Trainer{id: id, inserted_at: inserted_at, updated_at: updated_at, name: name}
      }) do
    %{
      data: %{
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
    }
  end

  def render("update_trainer.json", %{
        trainer: %Trainer{id: id, inserted_at: inserted_at, updated_at: updated_at, name: name}
      }) do
    %{
      data: %{
        trainer: %{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }
    }
  end
end

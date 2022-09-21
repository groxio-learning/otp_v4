defmodule Enforcer do
  alias Enforcer.Game

  def play(name),
    do: DynamicSupervisor.start_child(:deadpool, {Game, name})

  def guess(name, turn),
    do: Game.guess(name, turn)
end

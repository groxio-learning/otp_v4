defmodule Enforcer.Game do
  use GenServer
  alias Enforcer.Game.{Board, ScoreBoard}

  def start_link(answer \\ nil) do
    GenServer.start_link(__MODULE__, answer)
  end

  def guess(server, turn) do
    GenServer.cast(server, {:guess, turn})
  end

  @impl GenServer
  def init(answer) do
    {:ok, Board.new(answer)}
  end

  @impl GenServer
  def handle_cast({:guess, turn}, state) do
    new_state =
      state
      |> Board.guess(turn)

    status = Board.get_status(new_state)
    ScoreBoard.show(new_state, status)

    case status do
      :playing -> {:noreply, new_state}
      _ -> {:stop, :game_over, state}
    end
  end
end

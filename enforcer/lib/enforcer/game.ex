defmodule Enforcer.Game do
  use GenServer
  alias Enforcer.Game.{Board, ScoreBoard}

  def start_link(name) do
    IO.puts("Starting #{name}")
    GenServer.start_link(__MODULE__, nil, name: name)
  end

  def guess(server, turn) do
    server
    |> GenServer.call({:guess, turn})
    |> IO.puts()
  end

  def child_spec(name) do
    IO.puts("child_spec with a name #{name}")

    %{
      id: name,
      start: {__MODULE__, :start_link, [name]}
    }
  end

  @impl GenServer
  def init(answer) do
    IO.puts("Initialize")
    {:ok, Board.new(answer)}
  end

  @impl GenServer
  def handle_call({:guess, turn}, _from, state) do
    new_state =
      state
      |> Board.guess(turn)

    status = Board.get_status(new_state)
    view = ScoreBoard.show(new_state, status)

    case status do
      :playing -> {:reply, view, new_state}
      _ -> {:stop, view, state}
    end
  end
end

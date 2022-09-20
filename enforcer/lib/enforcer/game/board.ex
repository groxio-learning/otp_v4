defmodule Enforcer.Game.Board do
  defstruct [:answer, guesses: []]

  def new(answer) do
    %__MODULE__{answer: answer || random_answer()}
  end

  def guess(board, turn) do
    %{board | guesses: [turn | board.guesses]}
  end

  def get_status(board) do
    last_turn = List.first(board.guesses)

    if length(board.guesses) == 10 do
      "LOSE"
    end

    if last_turn == board.answer do
      "WIN"
    end

    "PLAYING"
  end

  def show(board) do
    """
      1 2 3 4 | RRWW
      1 2 3 4 | RRWW
      1 2 3 4 | RRWW
      1 2 3 4 | RRWW
      1 2 3 4 | RRWW

      Status: PLAYING/WIN/LOSE
    """
  end

  defp random_answer() do
    1..8 |> Enum.take_random(4)
  end
end

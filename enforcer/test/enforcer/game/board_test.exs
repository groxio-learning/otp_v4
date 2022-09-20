defmodule Enforcer.Game.BoardTest do
  use ExUnit.Case, async: true
  alias Enforcer.Game.Board

  test "constructor constructs" do
    assert %Board{answer: [1, 2, 3, 4], guesses: []} = Board.new([1, 2, 3, 4])
  end

  test "guess and we fail" do
    expected = %Board{answer: [1, 2, 3, 4], guesses: [[4, 1, 3, 5], [2, 1, 3, 5]]}
    guess = [4, 1, 3, 5]

    actual =
      [1, 2, 3, 4]
      |> Board.new()
      |> Board.guess([2, 1, 3, 5])
      |> Board.guess(guess)

    assert actual == expected
  end

  test "get_status gets me a status" do
    board = %Board{answer: [1, 2, 3, 4], guesses: [[4, 1, 3, 5], [2, 1, 3, 5]]}
    guess = [4, 1, 3, 5]

    actual =
      [1, 2, 3, 4]
      |> Board.new()
      |> Board.guess([2, 1, 3, 5])
      |> Board.guess(guess)
      |> Board.get_status()

    assert "PLAYING" == actual
  end

  test "get_status gets me a WIN" do
    board = %Board{answer: [1, 2, 3, 4], guesses: [[4, 1, 3, 5], [2, 1, 3, 5]]}
    guess = [1, 2, 3, 4]

    actual =
      [1, 2, 3, 4]
      |> Board.new()
      |> Board.guess([2, 1, 3, 5])
      |> Board.guess(guess)
      |> Board.get_status()

    assert "WIN" == actual
  end

  # test "show me the board state" do
  #   expected {turns: [{guess: [4, 1, 3, 5], score: "W"}, [2, 1, 3, 5]],}
  # end
end

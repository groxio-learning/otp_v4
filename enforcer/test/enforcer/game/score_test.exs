defmodule Enforcer.Game.ScoreTest do
  use ExUnit.Case
  alias Enforcer.Game.Score

  test "returnss the right score" do
    answer = [1, 2, 3, 4]

    guess_1 = [1, 2, 3, 4]
    guess_2 = [1, 4, 3, 2]
    guess_3 = [5, 6, 7, 9]
    guess_4 = [1, 1, 1, 1]
    guess_5 = [9, 1, 1, 1]

    assert Score.check(answer, guess_1) == "RRRR"
    assert Score.check(answer, guess_2) == "RRWW"
    assert Score.check(answer, guess_3) == ""
    assert Score.check(answer, guess_4) == "R"
    assert Score.check(answer, guess_5) == "W"
  end
end

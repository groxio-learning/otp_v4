defmodule Accountant.Core.MapCounterTest do
  use ExUnit.Case
  alias Accountant.Core.MapCounter

  test "modifies the count" do
    assert(
      %{count: 43} =
        MapCounter.new("42")
        |> assert_key(:count, 42)
        |> MapCounter.inc()
        |> assert_key(:count, 43)
        |> MapCounter.inc()
        |> assert_key(:count, 44)
        |> MapCounter.dec()
        |> assert_key(:count, 43)
    )
    |> IO.inspect()
  end

  def assert_key(acc, key, expected) do
    assert Map.get(acc, key) == expected
    acc
  end
end

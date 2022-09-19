defmodule AccountantTest do
  use ExUnit.Case
  doctest Accountant

  test "greets the world" do
    assert Accountant.hello() == :world
  end
end

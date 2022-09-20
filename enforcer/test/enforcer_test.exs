defmodule EnforcerTest do
  use ExUnit.Case
  doctest Enforcer

  test "greets the world" do
    assert Enforcer.hello() == :world
  end
end

defmodule Accountant.Core.FingerTrapTest do
  use ExUnit.Case, async: true

  alias Accountant.Core.FingerTrap

  describe "creating" do
    test "creates a new finger trap with one element" do
      assert FingerTrap.new(1) |> Enum.count() == 1
    end

    test "creates a new finger trap with two elements" do
      assert FingerTrap.new(2) |> Enum.count() == 2
    end

    test "creates a new finger trap with three elements" do
      assert FingerTrap.new(3) |> Enum.count() == 3
    end

    test "creates a new finger trap with 524,288 elements" do
      assert FingerTrap.new(524_288) |> Enum.count() == 524_288
    end

    # test "raises if given negative integer"
    # test "creates a new finger trap with zero elements"
    # test "handles string input"
  end

  describe "incrementing" do
    test "adds one element" do
      n = random_n()
      finger_trap = FingerTrap.new(n)

      assert FingerTrap.inc(finger_trap) |> Enum.count() == n + 1
    end
  end

  describe "decrementing" do
    test "removes one element" do
      n = random_n()

      assert FingerTrap.new(n)
             |> FingerTrap.dec()
             |> Enum.count() == n - 1
    end
  end

  describe "showing" do
    test "wraps the finger trap in a punny string" do
      n = random_n()
      ps = List.duplicate("p", n + 1)

      assert FingerTrap.new(n)
             |> FingerTrap.inc()
             |> FingerTrap.show() ==
               "My finger is trap#{ps}ed!"
    end
  end

  defp random_n(), do: Enum.random(1..524_288)
end

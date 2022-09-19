defmodule Accountant.Core.FingerTrap do
  @val :val

  @opaque t(_n) :: [:val]

  def new(n) when is_integer(n), do: List.duplicate(@val, n)

  def inc(finger_trap), do: [@val | finger_trap]

  def dec([_deleted | tail] = _finger_trap), do: tail

  def show(finger_trap) do
    ps = List.duplicate("p", Enum.count(finger_trap))
    "My finger is trap#{ps}ed!"
  end
end

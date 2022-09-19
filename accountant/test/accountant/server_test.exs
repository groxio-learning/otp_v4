defmodule Accountant.ServerTest do
  use ExUnit.Case, async: true
  alias Accountant.Server

  test "inc increments the value in state" do
    {:ok, server} = Server.start("42")

    assert :ok = Server.inc(server)
    assert "The count is: 43" = Server.show(server)
  end

  test "inc increments the value in state the wrong way" do
    {:ok, server} = Server.start("42")

    assert :ok = Server.inc(server)
    assert %Accountant.Core.MapCounter{count: 43} = :sys.get_state(server)
  end

  test "inc increments the value in state with random input" do
    random = Enum.random([0, 43423])
    {:ok, server} = Server.start("#{random}")

    expected = random + 1

    assert :ok = Server.inc(server)
    assert %Accountant.Core.MapCounter{count: ^expected} = :sys.get_state(server)
  end

  for random <- 0..100 do
    test "inc increments the value in state with random input a lot of times, attempt: #{random}" do
      random = Macro.escape(unquote(random))
      {:ok, server} = Server.start("#{random}")

      expected = random + 1

      assert :ok = Server.inc(server)
      assert %Accountant.Core.MapCounter{count: ^expected} = :sys.get_state(server)
    end
  end
end

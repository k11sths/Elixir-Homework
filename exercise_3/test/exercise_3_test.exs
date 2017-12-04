defmodule Exercise3Test do
  use ExUnit.Case
  doctest Exercise3

  test "greets the world" do
    assert Exercise3.hello() == :world
  end
end

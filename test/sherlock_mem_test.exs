defmodule SherlockMemTest do
  use ExUnit.Case
  doctest SherlockMem

  test "greets the world" do
    assert SherlockMem.hello() == :world
  end
end

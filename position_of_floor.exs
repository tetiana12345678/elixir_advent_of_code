defmodule Floor do

  def number([], floor, position) do
    IO.puts("floor #{floor}, position #{position}")
  end

  def number([ head | tail ], floor, position) when floor == -1 do
    IO.puts("floor #{floor}, position #{position}")
  end

  def number([ head | tail ], floor, position) when head == "(" do
    IO.puts("floor #{floor}, position #{position}")
    number(tail, floor + 1, position + 1)
  end

  def number([ head | tail ], floor, position) when head == ")" do
    IO.puts("floor #{floor}, position #{position}")
    number(tail, floor - 1, position + 1)
  end
end

{:ok, body} = File.read("brackets")
Floor.number(String.codepoints(body), 0, 0)



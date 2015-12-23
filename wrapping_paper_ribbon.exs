defmodule Ribbon do
@doc """
Part 2. Paper.ribbon/2 counts how much wrapping paper elphs needs for ribbon.
"""

  def area([], total) do
    IO.puts("total paper for ribbon needed #{total}")
  end

  def area([ hd | tl ], total) do
    [min1, min2, max ] = String.split(hd, "x")
                          |> Enum.map(fn(x) -> String.rstrip(x, ?\n) end)
                          |> Enum.map(fn(x) -> String.to_integer(x) end)
                          |> Enum.sort
    area(tl, total + min1 + min1 + min2 + min2 + min1*min2*max)
  end
end
Ribbon.area((File.stream!("./ribbon") |> Enum.to_list), 0)

defmodule Paper do

# 2*l*w + 2*w*h + 2*h*l
# 4x23x21

@doc """
Part 1. Paper.area/2 counts how much wrapping paper elphs needs.
"""
  def area([], total) do
    IO.puts("total wrapping paper needed #{total}")
  end

  def area([ hd | tl ], total) do
    [min1, min2, max ] = String.split(hd, "x")
                          |> Enum.map(fn(x) -> String.rstrip(x, ?\n) end)
                          |> Enum.map(fn(x) -> String.to_integer(x) end)
                          |> Enum.sort
    area(tl, total + 2*min1*min2 + 2*min2*max + 2*max*min1 + min1*min2)
  end
end

Paper.area((File.stream!("./dimensions") |> Enum.to_list), 0) #=> ["1x2x2\n", ...]


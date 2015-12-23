defmodule DrunkElf do
  def directions([], _visited_pos, _current, total) do
    IO.puts("houses get a few presents #{total}")
  end

  def directions([ hd | tl ], visited_pos, current, total) when hd == ">" do
    IO.puts "hd #{hd}, visited_pos #{inspect(visited_pos)}, total #{total}, first and last #{ inspect([List.first(current) + 1, List.last(current)]) }"

    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        IO.puts "hd #{hd}, visited_pos #{inspect(visited_pos)}, current #{ inspect([List.first(current) + 1, List.last(current)]) }, total #{total} "
        directions(tl, visited_pos, [List.first(current) + 1, List.last(current)], total)

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        directions(tl, [[List.first(current) + 1, List.last(current)] | visited_pos], [List.first(current) + 1, List.last(current)], total + 1)
    end
  end

  def directions([ hd | tl ], visited_pos, current, total) when hd == "^" do
    IO.puts "hd #{hd}, visited_pos #{inspect(visited_pos)}, current #{ inspect([List.first(current), List.last(current) + 1]) }, total #{total} "

    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions(tl, visited_pos, [List.first(current), List.last(current) + 1], total)

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions(tl, [[List.first(current), List.last(current) + 1] | visited_pos], [List.first(current), List.last(current) + 1], total + 1)
    end
  end

  def directions([ hd | tl ], visited_pos, current, total) when hd == "v" do
    IO.puts "hd #{hd}, visited_pos #{inspect(visited_pos)}, current #{ inspect([List.first(current), List.last(current) - 1]) }, total #{total} "

    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions(tl, visited_pos, [List.first(current), List.last(current) - 1], total)

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions(tl, [[List.first(current), List.last(current) - 1] | visited_pos], [List.first(current), List.last(current) - 1], total + 1)
    end
  end

  def directions([ hd | tl ], visited_pos, current, total) when hd == "<" do
    IO.puts "hd #{hd}, visited_pos #{inspect(visited_pos)}, current #{ inspect([List.first(current) - 1, List.last(current)]) }, total #{total} "

    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions(tl, visited_pos, [List.first(current) - 1, List.last(current)], total)

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions(tl, [[List.first(current) - 1, List.last(current)] | visited_pos], [List.first(current) - 1, List.last(current)], total + 1)
    end
  end
end

{:ok, body} = File.read("positions")
body = String.codepoints(String.rstrip(body, ?\n))
# DrunkElf.directions([">"], [[0, 0], []], [0, 0], 1)
# DrunkElf.directions(["^", ">", "v", "<"], [[0, 0], []], [0, 0], 1)
# DrunkElf.directions(["^", "v", "^", "v","^","v"], [[0, 0], []], [0, 0], 1)
DrunkElf.directions(body, [[0, 0], []], [0, 0], 1)


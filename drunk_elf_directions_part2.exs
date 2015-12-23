defmodule DrunkElf do
  def directions(all_directions) do
    directions_santa(Enum.take_every(all_directions, 2), [[0, 0], []], [0, 0]) #11
    directions_for_robot = Enum.take_every(List.delete_at(all_directions, 0), 2)
    directions_robot(directions_for_robot, [[0, 0], []], [0, 0])
  end

  def directions_santa([], visited_pos, _current) do
    IO.puts "santa visited positions #{inspect(visited_pos, limit: :infinity)}"
  end

  def directions_robot([], visited_pos, _current) do
    IO.puts "robot visited positions #{inspect(visited_pos, limit: :infinity)}"
  end

  def directions_santa([ hd | tl ], visited_pos, current) when hd == ">" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        directions_santa(tl, visited_pos, [List.first(current) + 1, List.last(current)])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        directions_santa(tl, [[List.first(current) + 1, List.last(current)] | visited_pos], [List.first(current) + 1, List.last(current)])
    end
  end

  def directions_santa([ hd | tl ], visited_pos, current) when hd == "^" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions_santa(tl, visited_pos, [List.first(current), List.last(current) + 1])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions_santa(tl, [[List.first(current), List.last(current) + 1] | visited_pos], [List.first(current), List.last(current) + 1])
    end
  end

  def directions_santa([ hd | tl ], visited_pos, current) when hd == "v" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions_santa(tl, visited_pos, [List.first(current), List.last(current) - 1])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions_santa(tl, [[List.first(current), List.last(current) - 1] | visited_pos], [List.first(current), List.last(current) - 1])
    end
  end

  def directions_santa([ hd | tl ], visited_pos, current) when hd == "<" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions_santa(tl, visited_pos, [List.first(current) - 1, List.last(current)])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions_santa(tl, [[List.first(current) - 1, List.last(current)] | visited_pos], [List.first(current) - 1, List.last(current)])
    end
  end

  def directions_robot([ hd | tl ], visited_pos, current) when hd == ">" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        directions_robot(tl, visited_pos, [List.first(current) + 1, List.last(current)])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) + 1, List.last(current)] end) ->
        directions_robot(tl, [[List.first(current) + 1, List.last(current)] | visited_pos], [List.first(current) + 1, List.last(current)])
    end
  end

  def directions_robot([ hd | tl ], visited_pos, current) when hd == "^" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions_robot(tl, visited_pos, [List.first(current), List.last(current) + 1])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) + 1] end) ->
        directions_robot(tl, [[List.first(current), List.last(current) + 1] | visited_pos], [List.first(current), List.last(current) + 1])
    end
  end

  def directions_robot([ hd | tl ], visited_pos, current) when hd == "v" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions_robot(tl, visited_pos, [List.first(current), List.last(current) - 1])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current), List.last(current) - 1] end) ->
        directions_robot(tl, [[List.first(current), List.last(current) - 1] | visited_pos], [List.first(current), List.last(current) - 1])
    end
  end

  def directions_robot([ hd | tl ], visited_pos, current) when hd == "<" do
    cond do
      Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions_robot(tl, visited_pos, [List.first(current) - 1, List.last(current)])

      !Enum.any?(visited_pos, fn(a) -> a == [List.first(current) - 1, List.last(current)] end) ->
        directions_robot(tl, [[List.first(current) - 1, List.last(current)] | visited_pos], [List.first(current) - 1, List.last(current)])
    end
  end
end

{:ok, body} = File.read("positions")
body = String.codepoints(String.rstrip(body, ?\n))
DrunkElf.directions(body)
# DrunkElf.directions(["^", "v"]) #3
# DrunkElf.directions(["^", ">", "v", "<"]) #3
# DrunkElf.directions(["^", "v", "^", "v", "^", "v", "^", "v", "^", "v"]) #11
# DrunkElf.directions(["^", ">", "v", "<", ">", "^", "<", "v" ]) #3

# DrunkElf.directions(body, [[0, 0], []], [0, 0], 1)
# santa_visited_pos ++ robot_visited_pos |> Enum.uniq |> length |> - 1

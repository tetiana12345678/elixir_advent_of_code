defmodule Encryption do

  def find_smallest_hex_number(num) do
    :calendar.universal_time()
    str = "bgvyzdsv"
    IO.puts "#{num}"

    if :crypto.hash(:md5, str <> Integer.to_string(num)) |> Base.encode16 |> String.starts_with? "00000" do
      IO.puts "ohhoo number is #{num}"
      :calendar.universal_time()
    else
      find_smallest_hex_number(num + 1)
    end
  end
end

Encryption.find_smallest_hex_number(0)



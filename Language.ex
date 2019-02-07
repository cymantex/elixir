defmodule Language do
  @moduledoc """
  This is a module comment.
  """

  import Utils

  @doc """
  This is a function comment
  """
  def main() do
    functions()
    lists()
    tuples()
    keyword_lists()
    maps()
    enumerables()
  end

  def enuerables do
    Utils.print_section_title("Enumerables")

    IO.puts("Mapping...")
    IO.inspect(Enum.map(1..4, fn (x) -> x * 2 end))

    Utils.print_event("Filtering...")
    IO.inspect(Enum.filter(
      %{"a" => 1, "b" => 2},
      fn ({key, value}) -> key === "a" end)
    )

    Utils.print_event("Reducing...")
    IO.inspect(Enum.reduce(1..5, fn (x, sum) -> sum + x end))

    Utils.print_event("Zipping...")
    IO.inspect(Enum.zip([1, 2], ["a", "b"]))

    Utils.print_event("Unique...")
    IO.inspect(Enum.uniq([1,2,2]))

    Utils.print_section_end()
  end

  def functions() do
    Utils.print_section_title("Functions")

    IO.puts("Anonymous function...")
    mod = fn (x, y) -> rem(x, y) end
    IO.puts("5 mod 3 = #{mod.(5, 3)}") #Ugly that it needs a . :(

    Utils.print_event("Anonymous function short hand...")
    mod2 = &(rem(&1, &2))
    IO.puts("5 mod 3 = #{mod2.(5, 3)}")

    Utils.print_event("Default function parameters...")
    IO.puts(default_params())

    Utils.print_event("Using functions in maps...")
    meow = fn () -> IO.puts("Meow!") end
    cat = %{sound: meow}
    cat.sound.()

    Utils.print_section_end()
  end

  def lists() do
    Utils.print_section_title("Lists")

    list = ["Item 1", "Item 2"]
    list2 = ["Item 3", "Item 4"]

    #Concatenates list with list2
    list3 = list ++ list2

    #Removes the elements in list from list3
    list4 = list3 -- list

    [first, second | rest] = list3
    IO.puts("Printing unpack of list3...")
    IO.puts("first: #{first} second: #{second} rest: #{rest}")

    Utils.print_event("Recursively iterating list4...")
    print_list(list4)

    #A list is enumerable. Which means it also supports map, filter and so on
    Utils.print_event("Iterating list2...")
    if ("Item 3" in list2) do
      Enum.each list2, fn item ->
        IO.puts(item)
      end
    end

    Utils.print_event("Using List helper...")
    IO.puts(List.foldl(list3, "", fn (item, items) -> "#{items} Hi #{item}!" end))

    Utils.print_event("List comprehensions...")
    IO.inspect(for n <- [1, 2, 3], do: n * 2)

    Utils.print_section_end()
  end

  def keyword_lists() do
    Utils.print_section_title("Keyword Lists")

    cat = [sound: "Meow"]
    IO.puts("Getting named value from list...")
    IO.puts(cat[:sound])

    Utils.print_section_end()
  end

  def maps() do
    Utils.print_section_title("Maps")

    capitals = %{"sweden" => "Stockholm"}

    IO.puts("Getting php style map value...")
    IO.puts(capitals["sweden"])

    capitals2 = %{norway: "Oslo"}
    Utils.print_event("Getting javascript style map value...")
    IO.puts(capitals2.norway)

    Utils.print_event("Using Map helper...")
    IO.puts(Map.put_new(capitals, "austria", "Vienna")["austria"])

    Utils.print_section_end()
  end

  def tuples() do
    Utils.print_section_title("Tuples")

    tuple = {"Item 1", "Item 2"}

    IO.puts("Getting first element from tuple...")
    IO.puts(elem(tuple, 0))

    tuple2 = Tuple.append(tuple, "Item 3")  

    Utils.print_event("Printing unpack of tuple2...")
    {first, second, third} = tuple2
    IO.puts "first: #{first} second: #{second} third: #{third}"

    Utils.print_section_end()
  end

  #Overloading and unpacking can be used to create clean recursion
  def print_list([head | rest]) do
    IO.puts head
    print_list(rest)
  end
  def print_list([]), do: nil

  def default_params(value \\ "Hello default parameters!") do
    value
  end
end
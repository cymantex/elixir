defmodule Utils do
  def print_section_title(section) do
    IO.puts "-------------------"
    IO.puts section
    IO.puts "-------------------"
  end

  def print_event(event) do
    IO.puts "\n#{event}"
  end

  def print_section_end() do
    IO.puts "-------------------"
  end
end

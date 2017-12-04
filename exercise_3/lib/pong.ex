defmodule Pong do

  def start(ping_pid) do
    play(ping_pid) 
  end

  def play(ping_pid) do
    receive do
      "ping" -> 
        IO.puts "ping"
        send(ping_pid, "pong")
      _ ->
        IO.puts :stderr, "Unexpected message received" 
    end
    play(ping_pid) 
  end
end

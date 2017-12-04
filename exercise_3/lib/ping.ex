defmodule Ping do


  def start do
    pong_pid = spawn_link(Pong, :start, [self()])
    send(pong_pid, "ping")
    play(pong_pid) 
  end

  def play(pong_pid) do
    receive do
      "pong" -> 
        IO.puts("pong")
        send(pong_pid, "ping")
      _ ->
        IO.puts :stderr, "Unexpected message received"
    end
    play(pong_pid) 
  end
end

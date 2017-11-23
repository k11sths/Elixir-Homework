defmodule Hw1Exs2 do
  @user %{name: "Superman", weight: {107, :kg}}

  def number2_if do
    name = Map.fetch!(@user, :name)
    if name == "Superman" do
      {weight, :kg} = Map.fetch!(@user, :weight)
      if weight > 100 do
        {:ok, name}
      else
        {:error, :wrong_weight}
      end
    else
      {:error, :wrong_name}
    end
  end
  def number2_case do
    name = Map.fetch!(@user, :name)
    case name do
      "Superman" -> 
        case Map.fetch!(@user, :weight) do
          {weight, :kg} when weight > 100 -> {:ok, name}
          _ -> {:error, :wrong_weight}
        end
      _ -> {:error, :wrong_name}
    end
  end
  def number2_cond do
    name = Map.fetch!(@user, :name)
    cond do
      name == "Superman" ->
        {weight, unit} = Map.fetch!(@user, :weight)
        cond do
          unit == :kg && weight > 100 -> {:ok, name}
          true -> {:error, :wrong_weight}
        end
      true -> {:error, :wrong_name}
    end
  end

  def number2_with do
    with \
      name when name == "Superman" <- Map.fetch!(@user, :name)
    do
      with \
        {weight, :kg} when weight > 100 <-  Map.fetch!(@user, :weight)
        do
          {:ok, name}
        else
          _error -> {:error, :wrong_weight}
        end
    else
      _error -> {:error, :wrong_name}
    end
  end

end
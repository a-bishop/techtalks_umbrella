defmodule Techtalks.Multimedia.Permalink do
  @behaviour Ecto.Type

  @impl true
  def type, do: :id

  @impl true
  def cast(binary) when is_binary(binary) do
    case Integer.parse(binary) do
      {int, _} when int > 0 -> {:ok, int}
      _ -> :error
    end
  end

  @impl true
  def cast(integer) when is_integer(integer) do
    {:ok, integer}
  end

  @impl true
  def cast(_) do
    :error
  end

  @impl true
  def dump(integer) when is_integer(integer) do
    {:ok, integer}
  end

  @impl true
  def load(integer) when is_integer(integer) do
    {:ok, integer}
  end

  # def embed_as(_) do
  #   :self
  # end

  # def equal?(_, _) do
  #   true
  # end
end

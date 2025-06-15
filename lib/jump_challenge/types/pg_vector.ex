defmodule JumpChallenge.Types.PgVector do
  @moduledoc """
  Custom Ecto type for PostgreSQL `vector(n)` fields using pgvector.
  """
  use Ecto.Type

  def type, do: :vector

  def cast(value) when is_binary(value), do: {:ok, value}
  def cast(value) when is_list(value) or is_tuple(value), do: {:ok, value}
  def cast(_), do: :error

  def dump(value) when is_binary(value), do: {:ok, value}
  def dump(value) when is_list(value) or is_tuple(value), do: {:ok, value}
  def dump(_), do: :error

  def load(value) when is_binary(value), do: {:ok, value}
  def load(value) when is_list(value) or is_tuple(value), do: {:ok, value}
  def load(_), do: :error
end

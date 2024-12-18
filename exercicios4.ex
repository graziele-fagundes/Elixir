defmodule Exercicios4 do
  def insertion_sort([]) do
    []
  end
  def insertion_sort([head|tail]) do
    insert(head, insertion_sort(tail))
  end

  def insert(x, []) do
    [x]
  end
  def insert(x, [head|tail]) do
    if x <= head do
      [x, head|tail]
    else
      [head | insert(x, tail)]
    end
  end

  def membro(x,[]) do
    false
  end
  def membro(x,[h|t]) do
    if x == h do
      true
    else
      membro(x,t)
    end
  end

  def quantas_vezes(x,[]) do
    0
  end
  def quantas_vezes(x,[h|t]) do
    if x == h do
      1 + quantas_vezes(x,t)
    else
      quantas_vezes(x,t)
    end
  end

  def unicos([]) do
    []
  end
  def unicos([head | tail]) do
    if quantas_vezes(head, [head | tail]) == 1 do
      [head | unicos(tail)]
    else
      unicos(tail)
    end
  end

  def quick_sort([]) do
    []
  end
  def quick_sort([head | tail]) do
    quick_sort([x || x <- tail, x < head]) ++ [head] ++ quick_sort([x || x <- tail, x >= head])
  end
end

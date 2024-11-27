defmodule Exercicios1 do
  def tres_iguais(x,y,z) do
    x == y && y == z
  end

  def quatro_iguais(a,b,c,d) do
    a == b && b == c && c == d
  end

  def quantos_iguais(x,y,z) do
    cond do
      tres_iguais(x,y,z) -> 3
      x == y || y == z || x == z -> 2
      todos_diferentes(x,y,z) -> 0
    end
  end

  def todos_diferentes(x,y,z) do
    x != y && y != z && x != z
  end

  def elevado_dois(x) do
    x * x
  end

  def elevado_quatro(x) do
    elevado_dois(x) * elevado_dois(x)
  end

  def palidromo?(str) do
    str == String.reverse(str)
  end

  def verifica_triangulo(x,y,z) do
    cond do
      (x + y) > z && (x + z) > y && (y + z) > x -> true
      true -> false
    end
  end

  def sinal(x) do
    cond do
      x < 0 -> -1
      x == 0 -> 0
      x > 0 -> 1
    end
  end

  def menor(x,y) do
    cond do
      x > y -> y
      y > x -> x
    end
  end

  def menor_tres(x,y,z) do
    menor(menor(x,y),z)
  end
end

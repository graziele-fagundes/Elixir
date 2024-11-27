defmodule Exemplo do
  def maior_de_idade(idade) do
   idade >= 18
  end

  def quadrado(x) do
   x * x
  end

  def menor(x,y) do
   cond do
   x > y -> y
   y > x -> x
   end
  end

  def par(x) do
   rem(x,2) == 0
  end

  def tres_iguais(x,y,z) do
    x == y && y == z
  end
end

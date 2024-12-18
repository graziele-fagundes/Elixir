defmodule Exercicios3 do
  def soma_lista([]) do
   0
  end
  def soma_lista([head|tail]) do
   head + soma_lista(tail)
  end

  def quadrado_lista([]) do
    []
   end
   def quadrado_lista([head|tail]) do
    [head*head | quadrado_lista(tail)]
   end

   def mult_dois_lista([])
   do
     []
   end
   def mult_dois_lista([head|tail])
   do
     [head*2 | mult_dois_lista(tail)]
   end

   def tamanho([]) do
     0
   end
   def tamanho([head|tail]) do
    1 + tamanho(tail)
  end

  def produto_lista([x]) do x end
  def produto_lista([h|t]) do h * produto_lista(t) end

  def and_lista([x,y]) do x && y end
  def and_lista([h|t]) do h && and_lista(t) end

  def insere_final([],x) do
    [] ++ [x]
  end
  def insere_final([head|tail],x) do
    [head | insere_final(tail,x)]
  end

  def neg_lista([]) do [] end
  def neg_lista([h|t]) do [not(h) | neg_lista(t)]  end

  def join([],[]) do
    []
  end
  def join([h1|t1],lista2) do
    [h1 | join(t1,lista2)]
  end

  def concat_lista([]) do
    []
  end
  def concat_lista([h|t]) do
    h ++ concat_lista(t)
  end

  def inverte_lista([]) do
    []
  end
  def inverte_lista([h|t]) do
    inverte_lista(t) ++ [h]
  end
end

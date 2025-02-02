defmodule Lista3 do
  def mult_dois_lista([]) do
    []
  end
  def mult_dois_lista([h|t]) do
    [h*2 | mult_dois_lista(t)]
  end

  def tamanho([]) do
    0
  end
  def tamanho([_h|t]) do
    1 + tamanho(t)
  end

  def produto_lista([]) do
    0
  end
  def produto_lista([n]) do
    n
  end
  def produto_lista([h|t]) do
    h * produto_lista(t)
  end

  def and_lista([a]) do
    a
  end
  def and_lista([h|t]) do
    h && and_lista(t)
  end

  # Prestar atençao para retornar uma lista para concatenar.
  def insere_final(x, []) do
    [x]
  end
  def insere_final(x, [h|t]) do
    [h | insere_final(x,t)]
  end

  def neg_lista([]) do
    []
  end
  def neg_lista([h|t]) do
    [not(h) | neg_lista(t)]
  end

  # Linha de raciocinio: lista vazia + lista qualquer é a lista qualquer.
  # Logo precisa esvaziar a primeira tirando sua cabeça a cada passada.
  def join([],[]) do
    []
  end
  def join([],[h|t]) do
    [h|t]
  end
  def join([h|t], b) do
    [h | join(t,b)]
  end

  def concat_lista([]) do
    []
  end
  def concat_lista([h|t]) do
    h ++ concat_lista(t)
  end
  def concat_lista_join([]) do
    []
  end
  def concat_lista_join([h|t]) do
    join(h,concat_lista_join(t))
  end

  def inverte_lista([]) do
    []
  end
  def inverte_lista([h|t]) do
    inverte_lista(t) ++ [h]
  end
end

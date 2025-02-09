# Ordenações
defmodule Lista4 do
  def insertion_sort([]) do
    []
  end
  def insertion_sort([h|t]) do
    ins(h,insertion_sort(t))
  end

  def ins(x,[]) do
    [x]
  end
  def ins(x,[h|t]) do
    cond do
      x <= h -> [x | [h|t]]
      x > h -> [h | ins(x,t)]
    end
  end

  def ins_elimina_repetidos(x,[]) do
    [x]
  end
  def ins_elimina_repetidos(x,[h|t]) do
    cond do
      x < h -> [x | [h|t]]
      x > h -> [h | ins(x,t)]
      x == h -> [x | t]
    end
  end

  def ins_decrescente(x,[]) do
    [x]
  end
  def ins_decrescente(x,[h|t]) do
    cond do
      x >= h -> [x | [h|t]]
      x < h -> [h | ins(x,t)]
    end
  end

  def menor(lista) do
    [h|_t] = insertion_sort(lista)
    h
  end

  def maior([x]) do
    x
  end
  def maior(lista) do
    [_h|t] = insertion_sort(lista)
    maior(t)
  end

  def membro([],_x) do
    false
  end
  def membro([h|t],x) do
    cond do
      h == x -> true
      true -> membro(t,x)
    end
  end

  def quantas_vezes([],_x) do
    0
  end
  def quantas_vezes([h|t],x) do
    cond do
      h == x -> 1 + quantas_vezes(t,x)
      true -> quantas_vezes(t,x)
    end
  end

  def membro2([h|t], x) do
    cond do
      quantas_vezes([h|t],x) > 0 -> true
      true -> false
    end
  end

  def unicos(lista) do
    unicos_aux([], lista)
  end

  def unicos_aux(_lista1,[]) do
    []
  end
  def unicos_aux(lista1, [h2|t2]) do
    cond do
      quantas_vezes(lista1,h2) == 0 && quantas_vezes(t2,h2) == 0 ->
        [h2 | unicos_aux(lista1 ++ [h2], t2)]

      true ->
        unicos_aux(lista1 ++ [h2], t2)
    end
  end

  def quick_sort([]), do: []
  def quick_sort([h|t]) do
    quick_sort(menores(h,t)) ++ [h] ++ quick_sort(maiores(h,t))
  end

  def menores(_pivo,[]) do
    []
  end
  def menores(pivo,[h|t]) do
    cond do
      h <= pivo -> [h | menores(pivo,t)]
      true -> menores(pivo,t)
    end
  end

  def maiores(_pivo,[]) do
    []
  end
  def maiores(pivo,[h|t]) do
    cond do
      h > pivo -> [h | maiores(pivo, t)]
      true -> maiores(pivo,t)
    end
  end

  def bubble_sort([]) do
    []
  end
  def bubble_sort([h|t]) do
    [h1|t1] = troca(h, bubble_sort(t))
    cond do
      verifica_ordenacao([h1|t1]) -> [h1|t1]
      true -> troca(h1, bubble_sort(t1))
    end
  end

  defp troca(x,[]) do
    [x]
  end
  defp troca(x,[h|t]) do
    cond do
      x > h -> [h | [x|t]]
      true -> [x | [h|t]]
    end
  end

  def verifica_ordenacao([]) do
    true
  end
  def verifica_ordenacao([h|[]]) do
    true
  end
  def verifica_ordenacao([h|[h2|t2]]) do
    cond do
      h > h2 -> false
      true -> verifica_ordenacao([h2|t2])
    end
  end

end

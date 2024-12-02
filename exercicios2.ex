defmodule Exercicios2 do
  def maxi(x,y) do
    cond do
      x > y -> x
      y > x -> y
      x == y -> x
    end
  end

  def vendas(n) when n>=0 do
    case n do
      0 -> 33
      1 -> 22
      2 -> 18
      3 -> 0
      4 -> 66
      _ -> 22
    end
  end


  def maior_venda(n) when n == 0 do
    vendas(n)
  end
  def maior_venda(n) when n>0 do
    maxi(vendas(n), maior_venda(n-1))
  end

  def semana_max_venda(n) when n == 0 do
    0
  end
  def semana_max_venda(n) when n>0 do
    cond do
      vendas(n) == maior_venda(n) -> n
      true -> semana_max_venda(n-1)
    end
  end

  def zero_vendas(n) when n==0 do
    -1
  end
  def zero_vendas(n) when n>0 do
    cond do
      vendas(n) == 0 -> n
      true -> zero_vendas(n-1)
    end
  end

  def acha_semana(s,n) when n==0 do
    cond do
      vendas(n) == s -> n
      true -> -1
    end
  end
  def acha_semana(s,n) when n>0 do
    cond do
      vendas(n) == s -> n
      true -> acha_semana(s, n-1)
    end
  end

  def multiplica_intervalo(m,n) when m==n do
    m
  end
  def multiplica_intervalo(m,n) when m<n do
    m * multiplica_intervalo(m+1,n)
  end

  def potencia(n,potencia) when potencia==0 do
    1
  end
  def potencia(n,potencia) when potencia==1 do
    n
  end
  def potencia(n,potencia) when potencia>1 do
    n * potencia(n,potencia-1)
  end

  def fib(n) when n==0 do
    0
  end
  def fib(n) when n==1 do
    1
  end
  def fib(n) when n>1 do
      fib(n-1) + fib(n-2)
  end
end

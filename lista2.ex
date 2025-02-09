# Recursão
defmodule Lista2 do
  def vendas(0), do: 33
  def vendas(1), do: 22
  def vendas(2), do: 18
  def vendas(3), do: 0
  def vendas(4), do: 66
  def vendas(_n), do: 22

  def maxi(a,b) do
    cond do
      a > b -> a
      true -> b
    end
  end

  def maior_venda(0) do
    vendas(0)
  end
  def maior_venda(n) do
    maxi(vendas(n), maior_venda(n-1))
  end

  def semana_max_venda(0) do
    0
  end
  def semana_max_venda(n) do
    cond do
    vendas(n) == maior_venda(n) -> n
    true -> semana_max_venda(n-1)
    end
  end

  def zero_vendas(0) do
    cond do
      vendas(0) == 0 -> 0
      true -> -1
    end
  end
  def zero_vendas(n) do
    cond do
      vendas(n) == 0 -> n
      true -> zero_vendas(n-1)
    end
  end

  def acha_semana(s,0) do
    cond do
      vendas(0) == s -> 0
      true -> -1
    end
  end
  def acha_semana(s,n) do
    cond do
      vendas(n) == s -> n
      true -> acha_semana(s,n-1)
    end
  end

  def acha_semana_intervalo(s,m,n) when m == n do
    cond do
      vendas(0) == s -> 0
      true -> -1
    end
  end
  def acha_semana_intervalo(s,m,n) do
    cond do
      vendas(n) == s -> n
      true -> acha_semana_intervalo(s,m,n-1)
    end
  end

  def produto_m_n(m,n) when m==n do
    n
  end
  def produto_m_n(m,n) do
    m * produto_m_n(m+1,n)
  end

  def potencia(_b,0) do
    1
  end
  def potencia(b,e) do
    b * potencia(b,e-1)
  end

  def fib(0) do
    0
  end
  def fib(1) do
    1
  end
  def fib(n) do
    fib(n-1) + fib(n-2)
  end
end

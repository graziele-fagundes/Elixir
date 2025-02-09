# Tuplas
defmodule Lista5 do
  def area({:quadrado, lado}) do
    lado * lado
  end
  def area({:retangulo, a, l}) do
    a*l
  end
  def area({:circulo, r}) do
    :math.pi() * (r * r)
  end

  def soma_tuplas({{a,b}, {c,d}}) do
    a+b+c+d
  end

  def shift({{x,y}, z}) do
    {x, {y,z}}
  end

  def mini(a,b) do
    cond do
      a < b -> a
      true -> b
    end
  end

  def maxi(a,b) do
    cond do
      a > b -> a
      true -> b
    end
  end

  def min_e_max(a,b,c) do
    {mini(mini(a,b),c) , maxi(maxi(a,b),c)}
  end

  def soma_lista_tuplas([]) do
    0
  end
  def soma_lista_tuplas([{a,b}|t]) do
    a + b + soma_lista_tuplas(t)
  end

  # Primeiro match mata.
  def zipp([],_l2), do: []
  def zipp(_l1,[]), do: []
  def zipp([h1|t1],[h2|t2]) do
    [{h1,h2} | zipp(t1,t2)]
  end

  def zip_tres([], _y, _z), do: []
  def zip_tres(_x, [], _z), do: []
  def zip_tres(_x, _y, []), do: []
  def zip_tres([h1|t1],[h2|t2],[h3|t3]) do
    [{h1,h2,h3} | zip_tres(t1,t2,t3)]
  end

  def unzip_esq([]) do
    []
  end
  def unzip_esq([{a,_b}|t]) do
    [a | unzip_esq(t)]
  end
  def unzip_dir([]) do
    []
  end
  def unzip_dir([{_a,b}|t]) do
    [b | unzip_dir(t)]
  end
  def unzip([h|t]) do
    {unzip_esq([h|t]), unzip_dir([h|t])}
  end
end

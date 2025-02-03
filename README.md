# Execução
## Linux
```
iex programa.ex
NomeModulo.NomeFuncao(parametro1, parametro2)
```
## Windows
```
iex.bat programa.ex
NomeModulo.NomeFuncao(parametro1, parametro2)
```

# Módulos e Funções 
```
defmodule NomeModulo do
    def NomeFuncao(n) do
        n
    end
end
```

# Sintaxe
```
def menor(x,y) do
    cond do
    x >= y -> y
    true -> x
    end
end

def menor(x,y) when x > y do
    y
end
def menor(x,y) when y > x do
    x
end
def menor(x,y) when y == x do
    raise "Erro"
end

def fat(0) do
    1
end
def fat(n) do
    n * fat(n-1)
end
```

# Listas
Geralmente usamos recursao com um caso de lista vazia e um com [h|t].

++          -> Concatena Listas.

[h|t]       -> separa a lista em head e tail.

[1|[2,3]]   -> Concatena uma head á um tail.

# Átomos e Tuplas
:legal                      -> Átomo cujo valor e nome é legal.

{:retangulo, 2, 3}          -> Tupla de valores, tamanho imutável.

# Funções Úteis
rem(10,3)                   -> Devolve o resto da divisão.

String.reverse("string")    -> Reverte uma string.
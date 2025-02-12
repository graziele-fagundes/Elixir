# Minesweeper/Campo Minado
# Graziele Fagundes - 21201339

defmodule Minesweeper do
  # Funções básicas para manipulação de listas
  def get_arr([h | _], 0), do: h
  def get_arr([_ | t], n), do: get_arr(t, n - 1)

  def update_arr([_ | t], 0, v), do: [v | t]
  def update_arr([h | t], n, v), do: [h | update_arr(t, n - 1, v)]

  # Manipulação de tabuleiro (matriz)
  def get_pos(tab, l, c), do: get_arr(get_arr(tab, l), c)

  def update_pos(tab, l, c, v),
    do: update_arr(tab, l, update_arr(get_arr(tab, l), c, v))

  # Verificação de mina
  def is_mine(tab, l, c), do: get_pos(tab, l, c)

  # Verificação de posição válida
  def is_valid_pos(size, l, c) do
    l >= 0 and l < size and c >= 0 and c < size
  end

  # Movimentos válidos
  def valid_moves(size, l, c) do
    moves = [{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]
    valid_moves_helper(size, l, c, moves, [])
  end

  defp valid_moves_helper(_, _, _, [], acc), do: acc
  defp valid_moves_helper(size, l, c, [{dl, dc} | t], acc) do
    new_l = l + dl
    new_c = c + dc
    case is_valid_pos(size, new_l, new_c) do
      true -> valid_moves_helper(size, l, c, t, [{new_l, new_c} | acc])
      false -> valid_moves_helper(size, l, c, t, acc)
    end
  end

  # Contagem de minas adjacentes
  def conta_minas_adj(tab, l, c) do
    conta_minas_helper(valid_moves(length(tab), l, c), tab, 0)
  end

  defp conta_minas_helper([], _, acc), do: acc
  defp conta_minas_helper([{l, c} | t], tab, acc) do
    case is_mine(tab, l, c) do
      true -> conta_minas_helper(t, tab, acc + 1)
      false -> conta_minas_helper(t, tab, acc)
    end
  end

  # Abertura de jogada
  def abre_jogada(l, c, minas, tab) do
    case is_mine(minas, l, c) do
      true -> tab
      false ->
        case get_pos(tab, l, c) do
          "-" ->
            minas_adj = conta_minas_adj(minas, l, c)
            novo_tab = update_pos(tab, l, c, Integer.to_string(minas_adj))
            case minas_adj do
              0 -> abre_adj(novo_tab, minas, valid_moves(length(tab), l, c))
              _ -> novo_tab
            end
          _ -> tab
        end
    end
  end
  defp abre_adj(tab, _, []), do: tab
  defp abre_adj(tab, minas, [{l, c} | t]), do: abre_adj(abre_jogada(l, c, minas, tab), minas, t)

  # Abertura de posição
  def abre_posicao(tab,minas,l,c) do
    case get_pos(tab,l,c) do
      "-" ->
        case is_mine(minas,l,c) do
          true -> update_pos(tab,l,c,"*")
          false -> update_pos(tab,l,c,Integer.to_string(conta_minas_adj(minas,l,c)))
        end
      _ -> tab
    end
  end

  # Abertura de tabuleiro em caso de vitória ou derrota
  def abre_tabuleiro(minas,tab) do
    abre_tabuleiro_helper(minas,tab,0,0)
  end
  def abre_tabuleiro_helper(minas, tab, l, c) do
    if l == length(tab) do
      tab
    else
      if c == length(tab) do
        abre_tabuleiro_helper(minas, tab, l + 1, 0)
      else
        abre_tabuleiro_helper(minas, abre_posicao(tab, minas, l, c), l, c + 1)
      end
    end
  end

  # Exibir o tabuleiro atual
  def board_to_string(tab) do
    tamanho = length(tab)

    cabecalho = "  " <> gerar_indices(0, tamanho - 1)
    linhas = gerar_linhas(tab, 0, tamanho)

    cabecalho <> "\n" <> linhas
  end

  defp gerar_indices(i, max) when i > max, do: ""
  defp gerar_indices(i, max), do: Integer.to_string(i) <> " " <> gerar_indices(i + 1, max)

  defp gerar_linhas([], _, _), do: ""
  defp gerar_linhas([linha | resto], num, tamanho) do
    linha_str = gerar_linha(linha, "")
    Integer.to_string(num) <> " " <> linha_str <> "\n" <> gerar_linhas(resto, num + 1, tamanho)
  end

  defp gerar_linha([], acc), do: acc
  defp gerar_linha([h | t], acc) do
    novo_acc = if acc == "", do: to_string(h), else: acc <> " " <> to_string(h)
    gerar_linha(t, novo_acc)
  end

  # Funções auxiliares para gerar o tabuleiro
  def gera_lista(0, _), do: []
  def gera_lista(n, v), do: [v | gera_lista(n - 1, v)]

  def gera_tabuleiro(n), do: gera_lista(n, gera_lista(n, "-"))

  def gera_mapa_de_minas(n), do: gera_lista(n, gera_lista(n, false))

  def conta_fechadas(tab), do: Enum.count(List.flatten(tab), &(&1 == "-"))

  def conta_minas(minas), do: Enum.count(List.flatten(minas), &(&1 == true))

  def end_game?(minas, tab), do: conta_fechadas(tab) == conta_minas(minas)
end

defmodule Motor do
  def main() do
    v = IO.gets("Digite o tamanho do tabuleiro: \n")
    {size, _} = Integer.parse(v)
    minas = gen_mines_board(size)
    IO.inspect minas
    tabuleiro = Minesweeper.gera_tabuleiro(size)
    game_loop(minas, tabuleiro)
  end

  def game_loop(minas, tabuleiro) do
    IO.puts Minesweeper.board_to_string(tabuleiro)
    v = IO.gets("Digite uma linha: \n")
    {linha, _} = Integer.parse(v)
    v = IO.gets("Digite uma coluna: \n")
    {coluna, _} = Integer.parse(v)

    if Minesweeper.is_mine(minas, linha, coluna) do
      IO.puts "VOCÊ PERDEU!!!!!!!!!!!!!!!!"
      IO.puts Minesweeper.board_to_string(Minesweeper.abre_tabuleiro(minas, tabuleiro))
      IO.puts "TENTE NOVAMENTE!!!!!!!!!!!!"
    else
      novo_tabuleiro = Minesweeper.abre_jogada(linha, coluna, minas, tabuleiro)
      if Minesweeper.end_game?(minas, novo_tabuleiro) do
        IO.puts "VOCÊ VENCEU!!!!!!!!!!!!!!"
        IO.puts Minesweeper.board_to_string(Minesweeper.abre_tabuleiro(minas, novo_tabuleiro))
        IO.puts "PARABÉNS!!!!!!!!!!!!!!!!!"
      else
        game_loop(minas, novo_tabuleiro)
      end
    end
  end

  def gen_mines_board(size) do
    add_mines(ceil(size * size * 0.15), size, Minesweeper.gera_mapa_de_minas(size))
  end

  def add_mines(0, _size, mines), do: mines
  def add_mines(n, size, mines) do
    linha = :rand.uniform(size - 1)
    coluna = :rand.uniform(size - 1)
    if Minesweeper.is_mine(mines, linha, coluna) do
      add_mines(n, size, mines)
    else
      add_mines(n - 1, size, Minesweeper.update_pos(mines, linha, coluna, true))
    end
  end
  end

  Motor.main()

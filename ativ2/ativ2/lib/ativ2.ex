defmodule Ativ2 do
  @moduledoc "Codigo para a Atividade 2 da disciplina Programacao Funcional"

  #####
  #
  # Atividade 2 - Funções recursivas e listas
  #
  # IMPORTANTE: Todos as funções a seguir devem ser escritas de forma
  # recursiva, sem utilizar funções pré-definidas em Elixir ou Erlang
  # que fazem todo o trabalho. O objetivo do exercício é aprender a
  # escrever funções recursivas "do zero", sem usar soluções prontas. 
  #
  #####

  # As funções primeiro e terceiro não são recursivas
  @doc "Retorna o primeiro elemento da lista l, ou nil caso l tenha menos de 1 elemento."
  def primeiro([]), do: nil 
  def primeiro([head | _]), do: head

  @doc "Retorna o terceiro elemento da lista l, ou nil caso l tenha menos de 3 elementos."
  def terceiro([]), do: nil
  def terceiro([_,_,third | _]), do: third
  def terceiro([_|tail]), do: terceiro(tail)

  @doc "Obtem o tamanho da lista l"
  def tamanho([]), do: 0
  def tamanho([_ | tail]), do: 1 + length(tail)

  # Um tipo comum de processamento de lista e' calcular um resultado levando
  # em consideracao todos os elementos da lista, por exemplo a soma ou
  # produto de uma lista de numeros.

  @doc "Calcula a soma dos numeros da lista l."
  def soma_lista([]), do: 0
  def soma_lista([head | tail]), do: head + soma_lista(tail)

  @doc "Calcula o produto dos numeros da lista l."
  def mult_lista([]), do: 1
  def mult_lista([head | tail]), do: head * mult_lista(tail)

  # Opcional: escreva uma versao de mult_lista que retorne zero assim que
  # encontrar um elemento 0 na lista, sem precisar ir ate' o fim da lista
  # e efetuar todas as multiplicacoes.

  @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
  def concat_lista([]), do: ""
  def concat_lista([head | tail]), do: head<>concat_lista(tail)

  @doc "Retorna o maior numero em uma lista de numeros (nil se a lista for vazia)."
  def max_lista([]), do: nil
  def max_lista([x]), do: x
  def max_lista([x | resto]), do: max(x, max_lista(resto))

  # As vezes podemos querer uma parte dos elementos da lista, sejam
  # os primeiros ou ultimos.

  @doc """
  Retorna os primeiros n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ativ2.primeiros_n([1, 2, 3, 4], 2)
  [1, 2]
  """
  def primeiros_n([], _n), do: []
  def primeiros_n(_l, 0), do: []
  def primeiros_n([head | tail], n), do: [head | primeiros_n(tail, n - 1)]

  @doc """
  Retorna os ultimos n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ativ2.ultimos_n([1, 2, 3, 4], 2)
  [3, 4]
  """
  def ultimos_n([], _n), do: []
  def ultimos_n(_, 0), do: []
  def ultimos_n([head | tail], n) when length([head|tail]) <= n, do: [head | tail]
  def ultimos_n([_head | tail] , n), do: ultimos_n(tail, n) 
  
  
  

  # Em algumas situacoes, queremos transformar cada elemento de uma lista da
  # mesma forma, obtendo uma nova lista com os resultados.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original, multiplicados por 2.

  Exemplo:
  iex> Ativ2.dobro_lista([1, 2, 3, 4])
  [2, 4, 6, 8]
  """
  def dobro_lista([]), do: []
  def dobro_lista([head | tail]), do: [head * 2 | dobro_lista(tail)]

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original elevados ao quadrado.

  Exemplo:
  iex> Ativ2.quadrado_lista([1, 2, 3, 4])
  [1, 4, 9, 16]
  """
  def quadrado_lista([]), do: []
  def quadrado_lista([head | tail]), do: [head*head | quadrado_lista(tail)]
  @doc """
  Dada uma lista de pares (tuplas de dois elementos), retornar uma lista
  apenas com o primeiro elemento de cada tupla.

  Exemplo:
  iex> Ativ2.primeiros_elementos([{:tamanho, 2}, {:cor, :branco}, {:preencher, true}])
  [:tamanho, :cor, :preencher]
  """
  def primeiros_elementos([]), do: []
  def primeiros_elementos([{retorno, _} | tail]), do: [retorno | primeiros_elementos(tail)]
  
  # Uma outra necessidade comum e' selecionar apenas os elementos de uma lista
  # que possuem alguma propriedade, por exemplo apenas os numeros positivos, ou
  # apenas as strings que comecam com uma letra maiuscula.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros positivos
  da lista original.

  Exemplo:
  iex> Ativ2.positivos_lista([-2, 2, 0, 88, 15, -11, 42])
  [2, 88, 15, 42]
  """
  def positivos_lista([]), do: []
  def positivos_lista([head | tail]) when head > 0, do: [head | positivos_lista(tail)]
  def positivos_lista([_head | tail]), do: positivos_lista(tail)  

  @doc "Retorna apenas os numeros pares de uma lista de numeros."
  def pares_lista([]), do: []
  def pares_lista([head | tail]) when rem(head, 2) == 0, do: [head | pares_lista(tail)]  
  def pares_lista([_head | tail]), do: pares_lista(tail)

  # Podemos querer fazer operacoes no agregado, combinando os elementos
  # de mesma posicao em duas listas, gerando uma terceira lista. Por exemplo,
  # somar as listas [1, 2, 3] e [4, 5, 6] elemento a elemento, resultando na
  # lista [5, 7, 9].

  @doc """
  Dadas duas listas de numeros, retorna uma lista com a soma de cada elemento
  de mesma posicao nas duas listas. Se uma das listas for menor que a outra,
  retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ativ2.soma_listas([1, 2, 3], [7, 8, 9, 3])
  [8, 10, 12]
  """
  
  def soma_listas(_, []), do: []
  def soma_listas([], _), do: []
  # def soma_listas([head1], [head2 | _tail]), do: [head1 + head2]
  # def soma_listas([head1 | _tail], [head2]), do: [head1 + head2]
  def soma_listas([head1 | tail1], [head2 | tail2]) do
    [head1 + head2 | soma_listas(tail1, tail2)]
  end
  

  @doc """
  Dadas duas listas de strings l1 e l2, retorna uma lista em que cada elemento
  e' a concatenacao dos elementos de mesma posicao em l1 e l2.
  Se uma das listas for menor que a outra, retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ativ2.concat_listas(["a", "b", "c"], ["x", "y", "z"])
  ["ax", "by", "cz"]
  """
  def concat_listas([], _), do: []
  def concat_listas(_, []), do: []
  def concat_listas([head1 | tail1], [head2 | tail2]) do
    [head1<>head2 | concat_listas(tail1, tail2)]
  end
  # Algumas outras manipulacoes de listas.

  # Dica: para append, e' possivel resolver apenas fazendo recursao e seguindo
  # a estrutura de uma das listas e pensando qual deve ser a resposta quando essa
  # lista for vazia.

  @doc """
  Junta/concatena duas listas, retornando uma lista com todos os elementos da
  primeira seguidos pelos elementos da segunda.

  Exemplo:
  iex> Ativ2.append([1, 2, 3], [4, 5, 6])
  [1, 2, 3, 4, 5, 6]
  """
  def append(l1,l2), do: l1 ++ l2

  # Dica: para a funcao a seguir, pode ser necessario definir uma funcao auxiliar.

  @doc """
  Retorna uma lista apenas com os elementos de posicao (indice) par na lista l.
  Considere o primeiro elemento como posicao 1 (e nao 0 como seria o indice).

  Exemplo:
  iex> Ativ2.posicoes_pares([2, 4, 6, 8, 10])
  [4, 8]
  """

  def posicoes_pares(l), do: posicoes_pares(l, 1)
  
  defp posicoes_pares([], _), do: []
  defp posicoes_pares([_ | t], index) when rem(index, 2) != 0, do: posicoes_pares(t, index + 1)
  defp posicoes_pares([h | t], index) when rem(index, 2) == 0, do: [h | posicoes_pares(t, index + 1)]
  
end

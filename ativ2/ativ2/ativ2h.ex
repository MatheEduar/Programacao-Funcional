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
    def primeiro([h | _]), do: h
  
    @doc "Retorna o terceiro elemento da lista l, ou nil caso l tenha menos de 3 elementos."
    def terceiro([]), do: nil
    def terceiro([_]), do: nil
    def terceiro([_, _]), do: nil
    def terceiro([_, _, h | _]), do: h
  
    @doc "Obtem o tamanho da lista l"
    def tamanho([]), do: 0
    def tamanho([_ | t]), do: 1 + tamanho(t)
  
    @doc "Calcula a soma dos numeros da lista l."
    def soma_lista([]), do: 0
    def soma_lista([h | t]), do: h + soma_lista(t)
  
    @doc "Calcula o produto dos numeros da lista l."
    def mult_lista([]), do: 1
    def mult_lista([h | t]), do: h * mult_lista(t)
  
    @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
    def concat_lista([]), do: ""
    def concat_lista([h | t]), do: h <> concat_lista(t)
  
    @doc "Retorna o maior numero em uma lista de numeros (nil se a lista for vazia)."
    def max_lista([]), do: nil
    def max_lista([h]), do: h
    def max_lista([h | t]) do
      max_rest = max_lista(t)
      if h > max_rest, do: h, else: max_rest
    end
  
    @doc """
    Retorna os primeiros n elementos da lista l.
    Se l tem n elementos ou menos, retorna a lista inteira.
    """
    def primeiros_n(_, 0), do: []
    def primeiros_n([], _), do: []
    def primeiros_n([h | t], n) when n > 0, do: [h | primeiros_n(t, n - 1)]
  
    @doc """
    Retorna os ultimos n elementos da lista l.
    Se l tem n elementos ou menos, retorna a lista inteira.
    """
    def ultimos_n(l, n) do
      len = tamanho(l)
      drop = len - n
      drop_n(l, drop)
    end
  
    defp drop_n(l, 0), do: l
    defp drop_n([], _), do: []
    defp drop_n([_ | t], n) when n > 0, do: drop_n(t, n - 1)
  
    @doc """
    Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
    original, multiplicados por 2.
    """
    def dobro_lista([]), do: []
    def dobro_lista([h | t]), do: [h * 2 | dobro_lista(t)]
  
    @doc """
    Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
    original elevados ao quadrado.
    """
    def quadrado_lista([]), do: []
    def quadrado_lista([h | t]), do: [h * h | quadrado_lista(t)]
  
    @doc """
    Dada uma lista de pares (tuplas de dois elementos), retornar uma lista
    apenas com o primeiro elemento de cada tupla.
    """
    def primeiros_elementos([]), do: []
    def primeiros_elementos([{f, _} | t]), do: [f | primeiros_elementos(t)]
  
    @doc """
    Dada uma lista de numeros, retorna uma nova lista com os numeros positivos
    da lista original.
    """
    def positivos_lista([]), do: []
    def positivos_lista([h | t]) when h > 0, do: [h | positivos_lista(t)]
    def positivos_lista([_ | t]), do: positivos_lista(t)
  
    @doc "Retorna apenas os numeros pares de uma lista de numeros."
    def pares_lista([]), do: []
    def pares_lista([h | t]) when rem(h, 2) == 0, do: [h | pares_lista(t)]
    def pares_lista([_ | t]), do: pares_lista(t)
  
    @doc """
    Dadas duas listas de numeros, retorna uma lista com a soma de cada elemento
    de mesma posicao nas duas listas. Se uma das listas for menor que a outra,
    retorna uma lista do tamanho da menor.
    """
    def soma_listas([], _), do: []
    def soma_listas(_, []), do: []
    def soma_listas([h1 | t1], [h2 | t2]), do: [h1 + h2 | soma_listas(t1, t2)]
  
    @doc """
    Dadas duas listas de strings l1 e l2, retorna uma lista em que cada elemento
    e' a concatenacao dos elementos de mesma posicao em l1 e l2.
    Se uma das listas for menor que a outra, retorna uma lista do tamanho da menor.
    """
    def concat_listas([], _), do: []
    def concat_listas(_, []), do: []
    def concat_listas([h1 | t1], [h2 | t2]), do: [h1 <> h2 | concat_listas(t1, t2)]
  
    @doc """
    Junta/concatena duas listas, retornando uma lista com todos os elementos da
    primeira seguidos pelos elementos da segunda.
    """
    def append([], l2), do: l2
    def append([h | t], l2), do: [h | append(t, l2)]
  
    @doc """
    Retorna uma lista apenas com os elementos de posicao (indice) par na lista l.
    Considere o primeiro elemento como posicao 1 (e nao 0 como seria o indice).
    """
    def posicoes_pares(l), do: posicoes_pares(l, 1)
  
    defp posicoes_pares([], _), do: []
    defp posicoes_pares([_ | t], index) when rem(index, 2) != 0, do: posicoes_pares(t, index + 1)
    defp posicoes_pares([h | t], index) when rem(index, 2) == 0, do: [h | posicoes_pares(t, index + 1)]
  
  end
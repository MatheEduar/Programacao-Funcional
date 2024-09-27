defmodule Ativ5 do
  @doc """
  Divide a string str em palavras. Uma palavra é considerada
  uma sequência de caracteres que não contém caracteres de
  espaço (espaço, tabulação, nova linha). Em uma frase com
  pontuação, essa divisão em palavras vai incluir a pontuação
  ao final da palavra (veja o exemplo).

  Exemplo:
  iex> Ativ5.palavras("A morsa subiu no coqueiro, e o coqueiro tremeu.")
  ["A", "morsa", "subiu", "no", "coqueiro,", "e", "o", "coqueiro", "tremeu."]
  """
  def palavras(str), do: String.split(str, ~r{\s}, trim: true)
  # ~r{} é a sintaxe para expressões regulares em Elixir

  @doc """
  Remove o último caractere de uma string.

  Exemplo:
  iex> Ativ5.remove_ultimo("multi-modalidades.")
  "multi-modalidades"
  """
  def remove_ultimo(str) do 
    tamanho = String.length(str)
    String.slice(str, 0..tamanho-2)
  end

  # @defaults [ignora_cx_alta: true, pontuacao: [".", ",", "!", "?"]]
  
  @doc """
  Calcula a frequência de ocorrência de palavras no texto, retornando
  um mapa em que cada chave é uma palavra do texto e o valor associado
  à chave é o número de vezes que a palavra ocorre no texto.

  A opção ignora_cx_alta tem valor booleano; se for verdadeira, a
  contagem de frequência deve ignorar a diferença entre letras
  maiúsculas e minúsculas. Por exemplo, com ignora_cx_alta verdadeira,
  as strings "Sorvete", "sorvete" e "sOrvEtE" são consideradas a mesma
  palavra. O padrão é verdadeiro.

  A opção pontuacao é uma lista de strings que representam símbolos
  de pontuação que são ignorados no final das palavras. Por exemplo,
  se a lista de pontuação inclui a string ".", as strings "tremeu"
  e "tremeu." (com um ponto final na última posição) são consideradas
  a mesma palavra. O padrão deve ser [".", ",", "!", "?"]. 
  """
  
  def freq_palavras(texto) do
    texto
    |> String.downcase()
    |> String.split(~r{\s})
    |> Enum.map(fn string -> 
      cond do 
        String.at(string, -1) in [".", ",", "!", "?"] -> remove_ultimo(string)
        true -> string
      end 
    end)
    |> Enum.filter(fn string -> string != "" end)
    |> Enum.frequencies()
  end

  def freq_palavras(texto, [ignora_cx_alta: false]) do
    texto
    |> String.split(~r{\s})
    |> Enum.map(fn string -> 
      cond do 
        String.at(string, -1) in [".", ",", "!", "?"] -> remove_ultimo(string)
        true -> string
      end 
    end)
    |> Enum.frequencies()
  end
  
  def freq_palavras(texto, opcoes \\ [pontuacao: [".", ",", "!", "?"]]) do
    texto
    |> String.downcase()
    |> String.split(~r{\s})
    |> Enum.map(fn string -> 
      cond do 
        String.at(string, -1) in opcoes[:pontuacao] -> remove_ultimo(string)
        true -> string
      end 
    end)
    |> Enum.frequencies()
  end

  @doc """
  Retorna uma lista com as palavras mais frequentes do texto, em ordem
  decrescente de ocorrência. A lista deve conter pares com o primeiro
  componente sendo a palavra e o segundo o número de ocorrências no texto.
  As opções são as mesmas da função freq_palavras.

  Exemplo
  iex> Ativ5.palavras_mais_frequentes("O gato pulou o muro e o rato seguiu o gato.")
  [{"o", 4}, {"gato", 2}, {"pulou", 1}, {"muro", 1}, {"e", 1}, {"rato", 1}, {"seguiu", 1}]
  """
  def palavras_mais_frequentes(texto) do
    texto
    |> String.downcase()
    |> String.split(~r{\s})
    |> Enum.map(fn string -> 
      cond do 
        String.at(string, -1) in [".", ",", "!", "?"] -> remove_ultimo(string)
        true -> string
      end 
    end)
    |> Enum.filter(fn string -> string != "" end)
    |> Enum.frequencies()
    |> Enum.sort_by(fn {_, numero} -> -numero end)
  end


  # Calcular a lista de palavras mais frequentes pode resultar em uma lista
  # grande se o texto original for grande. É possível limitar a lista apenas
  # às N palavras mais frequentes usando Enum.take:
  #
  # Ativ5.palavras_mais_frequentes(texto) |> Enum.take(10)
  #
  # No exemplo acima, a lista resultante terá as 10 palavras mais frequentes.
  #

  # A função le_arquivo a seguir pode ser usada para testar o cálculo
  # de frequência de palavras em textos mais longos que estão em
  # arquivos de texto.
  
  @doc """
  Lê o conteúdo de um arquivo texto e retorna como string. Vai causar um erro
  no programa caso não consiga ler o arquivo por qualquer motivo. 
  """
  def le_arquivo(nome) do
    { :ok, texto } = File.read(nome)
    texto
  end
end

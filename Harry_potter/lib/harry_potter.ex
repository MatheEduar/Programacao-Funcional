defmodule Harry_potter do
  
  @url "https://potterapi-fedeperin.vercel.app/pt/"

  def main() do
    Menu.start
    |> trata_str
    |> Tratar_req.obtem_resposta
    |> mostra_resultado
    end
    
  defp trata_str([opcao, choice]) do
    [@url<>choice<>"?search="<>opcao, choice]
  end

  defp mostra_resultado( [{ :error, _}, _]) do 
    IO.puts "\n\n\n\nPesquisa não encontrada\n\n"
    Menu.nova_consulta
  end

  defp mostra_resultado( [{ :ok, json} , choice]) do
    { :ok, [data] } = Poison.decode(json)
    case choice do
      "characters" -> mostra_character(data) 
      "books" -> mostra_book(data)
      "houses" -> mostra_house(data)
      "spells" -> mostra_spell(data)
    end
  end


  def mostra_character(character) do
    fullName = character["fullName"] 
    hogwartsHouse = character["hogwartsHouse"] 
    interpretedBy = character["interpretedBy"]
    nickname = character["nickname"]
    birthdate = character["birthdate"]
    Menu.limpar
    IO.puts "#{fullName}\n"
    IO.puts "Apelido: #{nickname}"
    IO.puts "Casa de Hogwarts: #{hogwartsHouse}"
    IO.puts "Interpretado por: #{interpretedBy}"
    IO.puts "Data de Aniversário: #{birthdate}"
    Menu.nova_consulta
  end

  def mostra_book(book) do
    number = book["number"]
    title = book["title"]
    releaseDate = book["releaseDate"]
    description = book["description"] 
    |> String.graphemes
    |> Enum.chunk_every(80)
    |> Enum.map(&Enum.join/1)
    |> Enum.join("\n")
    pages = book["pages"]
    Menu.limpar
    IO.puts "#{title}\n"
    IO.puts "\nData de lançamento: #{releaseDate}"
    IO.puts "\nNº de páginas: #{pages}"
    IO.puts "\nPosição na saga: #{number}"
    IO.puts "\nBreve descrição: \n\n#{description}"
    Menu.nova_consulta
  end

  def mostra_house(house) do
    casa = house["house"]
    fundador = house["founder"]
    animal = house["animal"]
    [fcolor, scolor] = house["colors"]
    Menu.limpar
    IO.puts "#{casa}\n"
    IO.puts "Fundador: #{fundador}"
    IO.puts "Animal: #{animal}"
    IO.puts "Cores: #{fcolor}, #{scolor}"
    Menu.nova_consulta
  end

  def mostra_spell(spell) do
    nome = spell["spell"]
    uso = spell["use"]
    Menu.limpar
    IO.puts "#{nome}\n\nUso: #{uso}"
    Menu.nova_consulta
  end

end

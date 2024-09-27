defmodule Menu do
    def start do
        limpar()
        IO.puts("O que você deseja saber sobre o universo de Harry Potter?\n")
        IO.puts("1) Sobre os Livros.")
        IO.puts("2) Sobre um Personagem.")
        IO.puts("3) Sobre as Casas de Hogwarts.")
        IO.puts("4) Sobre os Feitiços.")
        IO.puts("0) Sair.")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            0 -> limpar() 
                Process.exit(self(), :shutdown)
            1 -> mostrar_livro()
            2 -> mostrar_personagem()
            3 -> mostrar_casa()
            4 -> mostrar_feitico()
            _ -> IO.puts("Opção Inválida.")
                Harry_potter.main
        end
    end

    def mostrar_livro() do
        limpar()
        IO.puts("Qual é o número do livro?\n")
        IO.puts("1) Harry Potter e a Pedra Filosofal")
        IO.puts("2) Harry Potter e a Câmara Secreta")
        IO.puts("3) Harry Potter e o Prisioneiro de Azkaban")
        IO.puts("4) Harry Potter e o Cálice de Fogo")
        IO.puts("5) Harry Potter e a Ordem da Fênix")
        IO.puts("6) Harry Potter e o Enigma do Príncipe")
        IO.puts("7) Harry Potter e as Relíquias da Morte")
        IO.puts("8) Harry Potter e a Criança Amaldiçoada")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Harry%20Potter%20e%20a%20Pedra%20Filosofal", "books"]
            2 -> ["Harry%20Potter%20e%20a%20Câmara%20Secreta", "books"]
            3 -> ["Harry%20Potter%20e%20o%20Prisioneiro%20de%20Azkaban", "books"]
            4 -> ["Harry%20Potter%20e%20o%20Cálice%20de%20Fogo", "books"]
            5 -> ["Harry%20Potter%20e%20a%20Ordem%20da%20Fênix", "books"]
            6 -> ["Harry%20Potter%20e%20o%20Enigma%20do%20Príncipe", "books"]
            7 -> ["Harry%20Potter%20e%20as%20Relíquias%20da%20Morte", "books"]
            8 -> ["Harry%20Potter%20e%20a%20Criança%20Amaldiçoada", "books"]
            _ -> IO.puts("\nLivro Inválido!\n")
                Harry_potter.main
        end

    end
        
    def mostrar_personagem() do
        limpar()
        IO.puts "Qual personagem?\n"
        IO.puts "1) Harry James Potter"
        IO.puts "2) Hermione Jean Granger"
        IO.puts "3) Ron Weasley"
        IO.puts "4) Fred Weasley"
        IO.puts "5) George Weasley"
        IO.puts "6) Bill Weasley"
        IO.puts "7) Percy Weasley"
        IO.puts "8) Charlie Weasley"
        IO.puts "9) Ginny Weasley"
        IO.puts "10) Molly Weasley"
        IO.puts "11) Próxima Página ->"

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Harry%20James%20Potter", "characters"]
            2 -> ["Hermione%20Jean%20Granger", "characters"]
            3 -> ["Ron%20Weasley", "characters"]
            4 -> ["Fred%20Weasley", "characters"]
            5 -> ["George%20Weasley", "characters"]
            6 -> ["Bill%20Weasley", "characters"]
            7 -> ["Percy%20Weasley", "characters"]
            8 -> ["Charlie%20Weasley", "characters"]
            9 -> ["Ginny%20Weasley", "characters"]
            10 -> ["Molly%20Weasley", "characters"]
            11 -> mostrar_personagem2()
            _ -> IO.puts "\nCasa Inválida!"
                Harry_potter.main
        end

    end

    def mostrar_personagem2() do
        limpar()
        IO.puts "Qual personagem?\n"
        IO.puts "1) Arthur Weasley"
        IO.puts "2) Neville Longbottom"
        IO.puts "3) Luna Lovegood"
        IO.puts "4) Draco Lúcio Malfoy"
        IO.puts "5) Albus Percival Wulfric Brian Dumbledore"
        IO.puts "6) Minerva McGonagall"
        IO.puts "7) Remus Lupin"
        IO.puts "8) Rubeus Hagrid"
        IO.puts "9) Sirius Black"
        IO.puts "10) Severus Snape"
        IO.puts "11) Próxima Página ->"

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Arthur%20Weasley", "characters"]
            2 -> ["Neville%20Longbottom", "characters"]
            3 -> ["Luna%20Lovegood", "characters"]
            4 -> ["Draco%20Lúcio%20Malfoy", "characters"]
            5 -> ["Albus%20Percival%20Wulfric%20Brian%20Dumbledore", "characters"]
            6 -> ["Minerva%20McGonagall", "characters"]
            7 -> ["Remus%20Lupin", "characters"]
            8 -> ["Rubeus%20Hagrid", "characters"]
            9 -> ["Sirius%20Black", "characters"]
            10 -> ["Severus%20Snape", "characters"]
            11 -> mostrar_personagem3()
            _ -> IO.puts "\nCasa Inválida!"
                Harry_potter.main
        end

    end

    def mostrar_personagem3() do
        limpar()
        IO.puts "Qual personagem?\n"
        IO.puts "1) Bellatrix Lestrange"
        IO.puts "2) Lord Voldemort"
        IO.puts "3) Cedric Diggory"
        IO.puts "4) Ninfadora Tonks"
        IO.puts "5) James Potter"
        IO.puts "6) Página Inicial ->"

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Bellatrix%20Lestrange", "characters"]
            2 -> ["Lord%20Voldemort", "characters"]
            3 -> ["Cedric%20Diggory", "characters"]
            4 -> ["Ninfadora%20Tonks", "characters"]
            5 -> ["James%20Potter", "characters"]
            6 -> mostrar_personagem()
            _ -> IO.puts "\nCasa Inválida!"
                Harry_potter.main
        end

    end


    def mostrar_casa() do
        limpar()
        IO.puts("Qual Casa?\n")
        IO.puts("1) Grifinória.")
        IO.puts("2) Lufa-lufa.")
        IO.puts("3) Corvinal.")
        IO.puts("4) Sonserina.")
        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Grifinória", "houses"]
            2 -> ["Lufa-lufa", "houses"]
            3 -> ["Corvinal", "houses"]
            4 -> ["Sonserina", "houses"]
            _ -> IO.puts "\nCasa Inválida!"
                Harry_potter.main
        end
    end

    def mostrar_feitico() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Accio")
        IO.puts("2) Glisseo")
        IO.puts("3) Impervius")
        IO.puts("4) Wingardium Leviosa/Locomotor")
        IO.puts("5) Scourgify")
        IO.puts("6) Portus")
        IO.puts("7) Orchideous")
        IO.puts("8) Lumos")
        IO.puts("9) Reparo")
        IO.puts("10) Reducio")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Accio", "spells"]
            2 -> ["Glisseo", "spells"]
            3 -> ["Impervius", "spells"]
            4 -> ["Wingardium%20Leviosa/Locomotor", "spells"]
            5 -> ["Scourgify", "spells"]
            6 -> ["Portus", "spells"]
            7 -> ["Orchideous", "spells"]
            8 -> ["Lumos", "spells"]
            9 -> ["Reparo", "spells"]
            10 -> ["Reducio", "spells"]
            11 -> mostrar_feitico2()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico2() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Pack")
        IO.puts("2) Riddikulus")
        IO.puts("3) Protego")
        IO.puts("4) Muffliato")
        IO.puts("5) Silencio/Langlock")
        IO.puts("6) Expelliarmus")
        IO.puts("7) Oblivate")
        IO.puts("8) Episkey")
        IO.puts("9) Tergeo")
        IO.puts("10) Relashio")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Pack", "spells"]
            2 -> ["Riddikulus", "spells"]
            3 -> ["Protego", "spells"]
            4 -> ["Muffliato", "spells"]
            5 -> ["Silencio/Langlock", "spells"]
            6 -> ["Expelliarmus", "spells"]
            7 -> ["Oblivate", "spells"]
            8 -> ["Episkey", "spells"]
            9 -> ["Tergeo", "spells"]
            10 -> ["Relashio", "spells"]
            11 -> mostrar_feitico3()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico3() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Confundo")
        IO.puts("2) Expecto Patronum")
        IO.puts("3) Ferula")
        IO.puts("4) Alohomora")
        IO.puts("5) Nox")
        IO.puts("6) Quietus")
        IO.puts("7) Incendio")
        IO.puts("8) Homenum Revelio")
        IO.puts("9) Prior Incantato")
        IO.puts("10) Finite Incantatem")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Confundo", "spells"]
            2 -> ["Expecto%20Patronum", "spells"]
            3 -> ["Ferula", "spells"]
            4 -> ["Alohomora", "spells"]
            5 -> ["Nox", "spells"]
            6 -> ["Quietus", "spells"]
            7 -> ["Incendio", "spells"]
            8 -> ["Homenum%20Revelio", "spells"]
            9 -> ["Prior%20Incantato", "spells"]
            10 -> ["Finite%20Incantatem", "spells"]
            11 -> mostrar_feitico4()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico4() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Erecto")
        IO.puts("2) Diffindo")
        IO.puts("3) Stupefy")
        IO.puts("4) Repelo Muggletum")
        IO.puts("5) Avada Kedavra")
        IO.puts("6) Aguamenti")
        IO.puts("7) Geminio")
        IO.puts("8) Locomotor Mortis")
        IO.puts("9) Anapneo")
        IO.puts("10) Reducto")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Erecto", "spells"]
            2 -> ["Diffindo", "spells"]
            3 -> ["Stupefy", "spells"]
            4 -> ["Repelo%20Muggletum", "spells"]
            5 -> ["Avada%20Kedavra", "spells"]
            6 -> ["Aguamenti", "spells"]
            7 -> ["Geminio", "spells"]
            8 -> ["Locomotor%20Mortis", "spells"]
            9 -> ["Anapneo", "spells"]
            10 -> ["Reducto", "spells"]
            11 -> mostrar_feitico5()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico5() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Obscuro")
        IO.puts("2) Impedimenta")
        IO.puts("3) Cave Inimicum/Protego Totalum")
        IO.puts("4) Meteolojinx Recanto")
        IO.puts("5) Specialis Revelio")
        IO.puts("6) Descendo")
        IO.puts("7) Defodio")
        IO.puts("8) Aparecium")
        IO.puts("9) Piertotum Locomotor")
        IO.puts("10) Imperio")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Obscuro", "spells"]
            2 -> ["Impedimenta", "spells"]
            3 -> ["Cave%20Inimicum/Protego%20Totalum", "spells"]
            4 -> ["Meteolojinx%20Recanto", "spells"]
            5 -> ["Specialis%20Revelio", "spells"]
            6 -> ["Descendo", "spells"]
            7 -> ["Defodio", "spells"]
            8 -> ["Aparecium", "spells"]
            9 -> ["Piertotum%20Locomotor", "spells"]
            10 -> ["Imperio", "spells"]
            11 -> mostrar_feitico6()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico6() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Fidelius Charm")
        IO.puts("2) Avis/Oppugno")
        IO.puts("3) Expulso")
        IO.puts("4) Legilimens")
        IO.puts("5) Duro")
        IO.puts("6) Sonorus")
        IO.puts("7) Deprimo")
        IO.puts("8) Levicorpus")
        IO.puts("9) Liberacorpus")
        IO.puts("10) Mobilicorpus")
        IO.puts("11) Próxima Página ->")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Fidelius%20Charm", "spells"]
            2 -> ["Avis/Oppugno", "spells"]
            3 -> ["Expulso", "spells"]
            4 -> ["Duro", "spells"]
            5 -> ["Sonorus", "spells"]
            6 -> ["Descendo", "spells"]
            7 -> ["Deprimo", "spells"]
            8 -> ["Levicorpus", "spells"]
            9 -> ["Liberacorpus", "spells"]
            10 -> ["Mobilicorpus", "spells"]
            11 -> mostrar_feitico7()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def mostrar_feitico7() do
        limpar()
        IO.puts("Qual feitiço?\n")
        IO.puts("1) Confringo")
        IO.puts("2) Densaugeo")
        IO.puts("3) Incarcarous")
        IO.puts("4) Deletrius")
        IO.puts("5) Rictusempra")
        IO.puts("6) Petrificus Totalus")
        IO.puts("7) Fiendfyre Curse")
        IO.puts("8) Tarantallegra")
        IO.puts("9) Morsmordre")
        IO.puts("10) Sectumsempra")
        IO.puts("11) Crucio")
        IO.puts("12) Início.")

        opcao = IO.gets("") |> String.trim() |> String.to_integer()

        case opcao do
            1 -> ["Confringo", "spells"]
            2 -> ["Densaugeo", "spells"]
            3 -> ["Incarcarous", "spells"]
            4 -> ["Deletrius", "spells"]
            5 -> ["Rictusempra", "spells"]
            6 -> ["Petrificus%20Totalus", "spells"]
            7 -> ["Fiendfyre%20Curse", "spells"]
            8 -> ["Tarantallegra", "spells"]
            9 -> ["Morsmordre", "spells"]
            10 -> ["Sectumsempra", "spells"]
            11 -> ["Crucio", "spells"]
            12 -> mostrar_feitico()
            _ -> IO.puts "\n\nFeitiço Inválido!"
                Harry_potter.main
        end
    end

    def nova_consulta() do
        IO.puts "\n\n\n"
        IO.puts "Deseja fazer uma nova consulta? "
        IO.puts "S/N"

        opcao = IO.gets("") |> String.trim() |> String.downcase()

        case opcao do
            "s" -> Harry_potter.main
            "n" -> Process.exit(self(), :shutdown)
            _ -> IO.puts("Opção Inválida!")
                nova_consulta()
        end

    end


    def limpar() do
        IO.puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    end


end
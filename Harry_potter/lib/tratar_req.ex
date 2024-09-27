defmodule Tratar_req do
    
    def obtem_resposta([h | t]) do
        [HTTPoison.get(h) | t]
        |> processa_resposta
    end

    defp processa_resposta([{ :ok, %HTTPoison.Response{status_code: 200, body: b}}, choice]) do
        [{ :ok, b}, choice]
    end
    defp processa_resposta([{ :error, r}, choice]), do: [{ :error, r}, choice]
    defp processa_resposta([{ :ok, %HTTPoison.Response{status_code: _, body: b}}, choice]), do: [{ :error, b}, choice]

end
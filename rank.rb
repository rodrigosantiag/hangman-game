# frozen_string_literal: true

def salva_rank(nome, pontos)
  conteudo = "#{nome}\n#{pontos}"
  File.write 'rank.txt', conteudo
end

def le_rank
  arquivo = File.read 'rank.txt'
  arquivo.split("\n")
end

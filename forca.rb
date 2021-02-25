# frozen_string_literal: true

require_relative 'ui'

def joga(nome)
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    chute = pede_um_chute chutes, erros

    if chutes.include? chute
      avisa_chute_repetido chute
      next
    end

    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      quantidade_letras = palavra_secreta.count chute
      if quantidade_letras > 0
        avisa_acertou_letra chute, quantidade_letras
      else
        avisa_errou_letra
        erros += 1
      end
    else
      if chute.upcase == palavra_secreta.upcase
        avisa_acertou_palavra
        pontos_ate_agora += 100
        break
      else
        avisa_errou_palavra
        erros += 1
        pontos_ate_agora -= 30
      end
    end
  end

  avisa_pontos_ganhos pontos_ate_agora
end

nome = da_boas_vindas

loop do
  joga nome
  break if nao_quer_jogar?
end
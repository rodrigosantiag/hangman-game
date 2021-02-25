# frozen_string_literal: true

require_relative 'ui'

def monta_mascara(palavra_secreta, chutes)
  mascara = ''
  palavra_secreta.chars.each do |letra|
    mascara += chutes.include?(letra) ? letra : '_'
  end
  mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativas chutes, erros, mascara
  loop do
    chute = pede_um_chute

    if chutes.include? chute
      avisa_chute_repetido chute
    else
      return chute
    end
  end
end

def joga(nome)
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = monta_mascara palavra_secreta, chutes
    chute = pede_um_chute_valido chutes, erros, mascara

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

def jogo_da_forca
  nome = da_boas_vindas

  loop do
    joga nome
    break if nao_quer_jogar?
  end
end
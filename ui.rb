# frozen_string_literal: true

def da_boas_vindas
  puts "/****************/"
  puts "/ Jogo de Forca */"
  puts "/****************/"
  puts 'Qual o seu nome?'
  nome = gets.strip
  puts "Olá #{nome}! Vamos começar o jogo!"
  nome
end

def desenha_forca(erros)
  cabeca = "   "
  corpo = " "
  pernas = "   "
  bracos = "   "
  if erros >= 1
    cabeca = "(_)"
  end
  if erros >= 2
    bracos = " | "
    corpo = "|"
  end
  if erros >= 3
    bracos = "\\|/"
  end
  if erros >= 4
    pernas = "/ \\"
  end

  puts "  _______       "
  puts " |/      |      "
  puts " |      #{cabeca}  "
  puts " |      #{bracos}  "
  puts " |       #{corpo}  "
  puts " |      #{pernas}  "
  puts " |              "
  puts "_|___           "
  puts
end

def sorteia_palavra_secreta
  puts "\n\n\n\n"
  puts 'Sorteando a palavra secreta...'
  palavra_secreta = pega_palavra_do_dicionario
  puts "Palavra secreta selecionada! Ela contém #{palavra_secreta.size} letras."
  palavra_secreta
end

def nao_quer_jogar?
  puts 'Deseja jogar novamente? (S/N)'
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == 'N'
end

def cabecalho_de_tentativas(chutes, erros, mascara)
  puts "\n\n\n\n"
  desenha_forca erros
  puts "Palavra secreta: #{mascara}"
  puts "Número de erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
  puts 'Digite uma letra ou palavra:'
  chute = gets.strip.downcase
  puts "Você chutou #{chute}. Será que você acertou?"
  chute
end

def avisa_chute_repetido(chute)
  puts "Ops!! Você já chutou a letra \"#{chute}\" anteriomente. Tente novamente"
end

def avisa_acertou_letra(chute, quantidade_letras)
  msg = "Parabéns! A letra \"#{chute}\" aparece #{quantidade_letras} "
  msg += quantidade_letras == 1 ? 'vez' : 'vezes'
  msg += ' na palavra secreta!'
  puts msg
end

def avisa_errou_letra
  puts 'Poxa vida... essa letra não pertence à palavra secreta... :('
end

def avisa_acertou_palavra
  puts "\nParabéns, você ganhou!"
  puts

  puts "       ___________      "
  puts "      '._==_==_=_.'     "
  puts "      .-\\:      /-.    "
  puts "     | (|:.     |) |    "
  puts "      '-|:.     |-'     "
  puts "        \\::.    /      "
  puts "         '::. .'        "
  puts "           ) (          "
  puts "         _.' '._        "
  puts "        '-------'       "
  puts
end

def avisa_errou_palavra
  puts 'Você errou! Que pena :('
end

def avisa_pontos_ganhos(pontos, palavra_secreta)
  puts "Você ganhou #{pontos} pontos."
  puts "A palavra era #{palavra_secreta}"
end

def avisa_pontos_totais(pontos)
  puts "Você possui #{pontos} pontos."
end

def exibe_campeao_atual(campeao)
  puts "O campeão atual é #{campeao[0]} com #{campeao[1]} pontos."
end

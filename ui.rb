# frozen_string_literal: true

def da_boas_vindas
  puts 'Bem vindo ao jogo da forca!'
  puts 'Qual o seu nome?'
  nome = gets.strip
  puts "Olá #{nome}! Vamos começar o jogo!"
  nome
end

def sorteia_palavra_secreta
  puts "\n\n\n\n"
  puts 'Sorteando a palavra secrete...'
  palavra_secreta = 'programador'
  puts "Palavra secreta selecionada! Ela contém #{palavra_secreta.size} letras."
  palavra_secreta
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == 'N'
end

def cabecalho_de_tentativas(chutes, erros)
  puts "\n\n\n\n"
  puts "Número de erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
  puts 'Digite uma letra ou palavra:'
  chute = gets.strip
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
  puts "Poxa vida... essa letra não pertence à palavra secreta... :("
end

def avisa_acertou_palavra
  puts 'Acertou! Parabéns!'
end

def avisa_errou_palavra
  puts 'Você errou! Que pena :('
end

def avisa_pontos_ganhos(pontos)
  puts "Você ganhou #{pontos} pontos."
end

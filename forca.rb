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

def pede_um_chute(chutes, erros)
  puts "\n\n\n\n"
  puts "Número de erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
  puts 'Digite uma letra ou palavra:'
  chute = gets.strip
  puts "Você chutou #{chute}. Será que você acertou?"
  chute
end

def joga(nome)
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    chute = pede_um_chute chutes, erros

    if chutes.include? chute
      puts 'Ops!! Você já chutou esta letra anteriomente. Tente novamente'
      next
    end

    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      quantidade_letras = palavra_secreta.count chute
      if quantidade_letras > 0
        msg = "Parabéns! A letra \"#{chute}\" aparece #{quantidade_letras} "
        msg += quantidade_letras == 1 ?  'vez' : 'vezes'
        msg += ' na palavra secreta!'
        puts msg
      else
        puts "Poxa vida... essa letra não pertence à palavra secreta... :("
        erros += 1
      end
    else
      if chute.upcase == palavra_secreta.upcase
        puts 'Acertou! Parabéns!'
        pontos_ate_agora += 100
        break
      else
        puts 'Você errou! Que pena :('
        erros += 1
        pontos_ate_agora -= 30
      end
    end
  end

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = da_boas_vindas

loop do
  joga nome
  break if nao_quer_jogar?
end
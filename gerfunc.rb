def parabinario(n,bits)
	binario = []
	while n > 0
		if n%2 == 0
			binario << "0"
		else
			binario << "1"
		end
		n = (n/2).to_i
	end
	for i in 1..(bits-binario.count) do
		binario << "0"
	end
	return binario.reverse.join
end

def comp2(n)
	temp = []
	temp = n.split('')
	for i in 0..(temp.size-1) do
		if temp[i] == "0"
			temp[i] = "1"
		else
			temp[i] = "0"
		end
	end
	i = temp.size-1
	while i >= 0 do
		if temp[i] == "0"
			temp[i] = "1"
			i = -1
		else
			temp[i] = "0"
			i -= 1
		end
	end
	return temp.join
end

outra = "s"
while outra == "s" do
	verificador = 0
	while verificador == 0 do
		verificador = 1
		print "Informe a Operação: "
		opcode = gets.chomp
		opcode = opcode.downcase
		if opcode == "and"
			opcode = "00000"
		elsif opcode == "or"
			opcode = "00001"
		elsif opcode == "nand"
			opcode = "00010"
		elsif opcode == "xor"
			opcode = "00011"
		elsif opcode == "soma naturais"
			opcode = "00100"
		elsif opcode == "soma inteiros"
			opcode = "00101"
		elsif opcode == "subtracao"
			opcode = "00110"
		elsif opcode == "desloc. esquerda"
			opcode = "00111"
		elsif opcode == "desloc direita"
			opcode = "01000"
		elsif opcode == "desloc. aritmetico"
			opcode = "01001"
		elsif opcode == "rotacionar p/ esquerda"
			opcode = "01010"
		elsif opcode == "slt"
			opcode = "01011"
		elsif opcode == "soma com constante"
			opcode = "01100"
		elsif opcode == "bnq"
			opcode = "11101"
		elsif opcode == "beq"
			opcode = "11110"
		elsif  opcode == "jump"
			opcode = "11111"
		else
			verificador = 0
			puts "Operação inválida."
		end
	end

	print "Digite o registrador destino: "
	rdest = gets.to_i
	print "Digite o registrador fonte 1: "
	rfonte1 = gets.to_i
	print "Digite o registrador fonte 2: "
	rfonte2 = gets.to_i
	print "Digite a constante: "
	constante = gets.to_i
	sinal = "positivo"
	sinal = "negativo" if constante < 0

	rdest = parabinario(rdest,5)
	rfonte1 = parabinario(rfonte1,5)
	rfonte2 = parabinario(rfonte2,5)
	constante *= -1 if sinal == "negativo"
	constante = parabinario(constante,12)
	constante = comp2(constante) if sinal == "negativo"

	binario = []
	binario << opcode
	binario << rdest
	binario << rfonte1
	binario << rfonte2
	binario << constante
	binario = binario.join.split("")
	hexa = []
	i = 0
	while i < 32 do
		temp = []
		for j in i..(i+3) do
			temp << binario[j]
		end
		hexa << temp.join
		i = i+4
	end
	for i in 0..(hexa.count-1) do
		if hexa[i] == "0000"
			hexa[i] = "0"
		elsif hexa[i] == "0001"
			hexa[i] = "1"
		elsif hexa[i] == "0010"
			hexa[i] = "2"
		elsif hexa[i] == "0011"
			hexa[i] = "3"
		elsif hexa[i] == "0100"
			hexa[i] = "4"
		elsif hexa[i] == "0101"
			hexa[i] = "5"
		elsif hexa[i] == "0110"
			hexa[i] = "6"
		elsif hexa[i] == "0111"
			hexa[i] = "7"
		elsif hexa[i] == "1000"
			hexa[i] = "8"
		elsif hexa[i] == "1001"
			hexa[i] = "9"
		elsif hexa[i] == "1010"
			hexa[i] = "A"
		elsif hexa[i] == "1011"
			hexa[i] = "B"
		elsif hexa[i] == "1100"
			hexa[i] = "C"
		elsif hexa[i] == "1101"
			hexa[i] = "D"
		elsif hexa[i] == "1110"
			hexa[i] = "E"
		elsif hexa[i] == "1111"
			hexa[i] = "F"
		end
	end

	binario = binario.join
	hexa = hexa.join

	puts "#{binario} - #{hexa}"
	puts "Mais uma? (s/n)"
	outra = gets.chomp
end
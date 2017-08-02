file_o_p = input("Arquivo de origem: ")
file_d_p = input("Arquivo de destino: ")

file_o = open(file_o_p, "r")
file_d = open(file_d_p, "w+")
file_d.truncate()
file_d.write("v2.0 raw\n")

comands = file_o.readlines()

def gerar_ope(*code):
	ope, rdest, rfonte1, rfonte2, con = code
	operacoes = { 
					'and': '00000', 
					'or': '00001', 
					'xor': '00010', 
					'nand': '00011', 
					'soman': '00100', 
					'somai': '00101', 
					'sub': '00110', 
					'desle': '00111', 
					'desld': '01000', 
					'deslda': '01001', 
					'rol': '01010', 
					'slt': '01011', 
					'somac': '01100',
					'bne': '11101',
					'beq': '11110',
					'jmp': '11111'
				}

	opec = bin(int("0b" + operacoes[ope], 2))[2:].zfill(5)
	rdestb = bin(int(rdest))[2:].zfill(5)
	rfonte1b = bin(int(rfonte1))[2:].zfill(5)
	rfonte2b = bin(int(rfonte2))[2:].zfill(5)
	conb = bin(int(con) & 0b111111111111)[2:].zfill(12)

	opeb = opec+rdestb+rfonte1b+rfonte2b+conb
	opeh = hex(int(opeb, 2))[2:]

	return (opeh)

for i, c in enumerate(comands):
	com = c.split(", ")
	com[-1] = com[-1].strip()
	file_d.write(gerar_ope(*com))

	if (i+1)%8 == 0:
		file_d.write("\n")
	else:
		file_d.write(" ")

file_o.close()
file_d.close()
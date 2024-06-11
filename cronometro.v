module cronometro(clock,dsClock,segmento,digitos,chave,botao);
	input clock,botao;
	input chave; // Chave = 1 - Aspersão; Chave = 0 - Gotejamento;
	output [6:0]segmento;
	output [3:0]digitos;
	
	// Selecionar Digito;
	wire [3:0]dig;
	contador digito(dsClock,1,1,0,0,botao,dig);
	muxDigito(dig[0],dig[1],digitos);
	
	// Decrementador com Preset de acordo com a Rega;
	
	
	
endmodule
module muxDigito(um,dois,Digito);
	input um,dois;
	output [3:0] Digito;
	
	and(Digito[0],!um,!dois);
	and(Digito[1],!um,dois);
	and(Digito[2],um,!dois);
	and(Digito[3],um,dois);
endmodule
module CodNum(A,B,C,D,segmento);
	input A,B,C,D;
	output [6:0]segmento;
	wire nA,nB,nC,nD;
	wire aux[12:0];
	not(nA,A);
	not(nB,B);
	not(nC,C);
	not(nD,D);
	
	// Letra A;
	and(aux[0],nA,nB,nC,D);
	and(aux[1],B,nC,nD);
	or(segmento[0],aux[1],aux[0]);
	
	//Letra B;
	and(aux[2],B,nC,D);
	and(aux[3],B,C,nD);
	or(segmento[1],aux[2],aux[3]);
	
	//Letra C;
	and(segmento[2],nB,C,nD);
	
	//Letra D;
	or(aux[4],B,nC,nD);
	or(aux[5],nA,nB,nC,D);
	or(aux[6],B,C,D);
	and(segmento[3],aux[4],aux[5],aux[6]);
	
	//Letra E;
	and(aux[7],B,nC);
	or(segmento[4],D,aux[7]);
	
	//Letra F;
	and(aux[8],nB,C);
	and(aux[9],C,D);
	and(aux[10],nA,nB,D);
	or(segmento[5],aux[8],aux[9],aux[10]);
	
	//Letra G;
	and(aux[11],nA,nB,nC);
	and(aux[12],B,C,D);
	or(segmento[6],aux[11],aux[12]);
	
endmodule

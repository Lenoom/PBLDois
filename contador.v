module contador(clock,pre0,pre1,pre2,pre3,button,Q);
 input clock,button;
 input pre0,pre1,pre2,pre3;
 output [3:0]Q;
 wire [3:0]resetin;
 wire [3:0] presetout,resetout,aux,bot;
 wire sinal;
 or(botao,sinal,button);
 
 not(resetin[0],pre0);
 not(resetin[1],pre1);
 not(resetin[2],pre2);
 not(resetin[3],pre3);
 
 and(presetout[0], botao, pre0);
 and(presetout[1], botao, pre1);
 and(presetout[2], botao, pre2);
 and(presetout[3], botao, pre3);
 
 and(resetout[0], botao, resetin[0]);
 and(resetout[1], botao, resetin[1]);
 and(resetout[2], botao, resetin[2]);
 and(resetout[3], botao, resetin[3]);
 
 FlipFlopT(presetout[0],resetout[0],1,clock,Q[0]);  // D
 
 or(aux[0],Q[3],Q[2],Q[1]);
 and(T1,aux[0],!Q[0]);
 FlipFlopT(presetout[1],resetout[1],T1,clock,Q[1]); // C
 
 and(aux[1],!Q[1],Q[2]);
 or(aux[2],aux[1],Q[3]);
 and(T2,aux[2],!Q[0]);
 FlipFlopT(presetout[2],resetout[2],T2,clock,Q[2]); // B
 
 and(T3,!Q[2],!Q[1],!Q[0]);
 FlipFlopT(presetout[3],resetout[3],T3,clock,Q[3]); // A
 
 // Abaixo, verifica qual contador está sendo rodado, e ao chegar em 0000 manda um pulso simulando o botão -
 // para pre-setar os valores novamente;
 
 // Contador 6 -> 0 ;
 and(bot[0],!Q[0],!Q[1],!Q[2],!Q[3],!pre0,pre1,pre2,!pre3);
 
 // Contador 5 -> 0 ;
 and(bot[1],!Q[0],!Q[1],!Q[2],!Q[3],pre0,!pre1,pre2,!pre3);
 
 // Contador 3 -> 0 ;
 and(bot[2],!Q[0],!Q[1],!Q[2],!Q[3],pre0,pre1,!pre2,!pre3);
 
 // Contador 1 -> 0 ; 
 and(bot[3],!Q[0],!Q[1],!Q[2],!Q[3],pre0,!pre1,!pre2,!pre3);
 
 or(sinal,bot[0],bot[1],bot[2],bot[3]);
 
endmodule
module Debouncer(clock,botao,saida);
    input clock, botao;
    output saida;
    wire [2:0]aux;


    flipFlopD um(clock,botao,0,aux[0]);
    flipFlopD dois(clock,aux,0,aux[1]);
    not(aux[2],aux[1]);
    and(saida, aux[2],aux[0]);
endmodule

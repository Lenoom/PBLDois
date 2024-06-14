module geraNum(clock,aspersao,gotejamento,casoEspecifico, botao, niveis, Us, Ds, Um, Dm);
    input clock,botao,gotejamento,aspersao,casoEspecifico;
    input [2:0]niveis; // niveis[0] = Low, 1 = Medium, 2 = High
    output [3:0]Us,Ds,Um,Dm;
    wire [3:0] unid_minutopreset,dez_minutopreset,unid_segundopreset,dez_segundopreset;
	 wire flag,clockin,clockdseg,clockumin,clockdmin;
    
    // Gera os Presets pra cada situaçao de minutos;
    geraPreset(niveis,aspersao,gotejamento,casoEspecifico,dez_segundopreset,unid_segundopreset,unid_minutopreset,dez_minutopreset);
    
    // Manda os presets pra as instancias de Contadores e retorna o numero de 4 bits a cada clock;
	 and(clockin,clock,!flag);
    contador (clock,unid_segundopreset,botao,Us);
	 
	 and(clockdseg,Us[0],!Us[1],!Us[2],Us[3]);// Quando a unidade de segundos for 9 ele atualiza;
    contador (clockdseg,dez_segundopreset,botao,Ds);
    
	 and(clockumin,Ds[0],!Ds[1],Ds[2],!Ds[3]); // Quando a dezena de Segundos for 5 ele atualiza;
    contador(clockumin,unid_minutopreset,botao,Um);
	 
	 and(clockdmin,Um[0],!Um[1],!Um[2],Um[3]); // Quando ele inicia em 30 (9) atualiza
    contador(clockdmin,dez_minutopreset,botao,Dm);
    
	 and(flag,Us[0],Us[1],Us[2],Us[3],Ds[0],Ds[1],Ds[2],Ds[3],Um[0],Um[1],Um[2],Um[3],Dm[0],Dm[1],Dm[2],Dm[3]);
endmodule

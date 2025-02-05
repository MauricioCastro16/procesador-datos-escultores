program escultores;
uses crt;

const
	Num = ['0','1','2','3','4','5','6','7','8','9'];

var
  	Sec: file of char;
  	Sec_Sal: file of char;
  	v, aux: char;
  	Material: char; //No se puede designar un conjunto para una variable, por lo que se recurrió a un ciclo para comprobarlo
    Pais: char;
    Bandera1, Bandera2: boolean;
    cont, contA, contC, contP, contTotal, i: integer;


    begin
    	assign(sec, 'entrada.txt');
  			{$I-}
  		reset(sec);
  			{$I+}
  		if IOResult <> 0 then
   			begin
   				halt(2);
   			end;
  		read(sec, v);

    	assign(Sec_Sal, 'salida.txt');
    	rewrite(Sec_Sal);

      ContA:= 0;
      ContP:= 0;
      ContC:= 0;
      cont:= 0;
      material:= 'X';
      pais:= 'X';

      While (material<>'A') and (material<>'P') and (material<>'M') do //sería óptimo usar un repetir en esta situación, pero hubieron inconvenientes
      begin
      Writeln('Ingresar un material para contar los artistas del mismo (Para madera la "A"; para piedra la "P"; para metal la "M")');
      Readln(material);
      end;

      While (pais<>'A') and (pais<>'P') and (pais<>'C') do
      begin
    	Writeln('Y tambien un pais (Para Argentina la "A"; para Peru la "P"; para Chile la "C")');
    	Readln(pais);
      end;

    	While v<>('$') do //Este es nuestro fin de secuencia
    		begin
    		Bandera1:= false;
    		Bandera2:= false;
    		case v of
    		    'A': ContA:= ContA + 1;
          		'C': ContC:= ContC + 1;
         	 	'P': ContP:= ContP + 1;
    		end;
    			if v = Pais then
    				begin
    					Bandera1:= true;
    				end;
    		while v <> '|' do
    			begin
    				write(Sec_Sal, v);
    				read(Sec, v);
    			end;

    		write(Sec_Sal, v);
    		read(Sec, v);

    		for i:= 1 to 4 do
    			begin
	    			if v in Num then
              begin
	    				 write(Sec_Sal, v)
              end
	    			else
              begin
              case v of //ésto era un procedimiento, pero saltaba un error que no supimos resolver, por lo que lo trasladamos acá
                  'a': aux:= '0';
                  'e': aux:= '2';
                  'i': aux:= '4';
                  'o': aux:= '6';
                  'u': aux:= '8';
              end;
              write(Sec_Sal, aux);
              end;
	    			read(Sec, v);
	    		end;
	    	if v = Material then
	    		begin
	    			Bandera2:= true;
	    		end;

	    		write(Sec_Sal, v);
    			read(Sec, v);
    		If (v = 'S') and (Bandera1 = true) and (Bandera2 = true) then
    			begin
    				cont:= cont + 1;
    			end;
    			write(Sec_Sal, v);
    			read(Sec, v);
    	end;

        Write(Sec_sal, '$'); //Se agregó el fin de secuencia también en la salida por si tiene que ser tratado más adelante
      	ContTotal:= ContA+ContC+ContP;

      	Writeln('La cantidad de escultores que hablan ingles y cumplen las caracteristicas dadas son:', cont);
      	Writeln('La cantidad de escultores de Argentina son: ', ContA, ', y representan el', (ContA/ContTotal)*100:10:2, '%');
      	writeln('La cantidad de escultores de Chile son: ', ContC, ', y representan el', (ContC/ContTotal)*100:10:2, '%');
      	Writeln('La cantidad de escultores de Peru son: ', ContP, ', y representan el', (ContP/ContTotal)*100:10:2, '%');
        Close(Sec);
        Close(Sec_sal);
        Readln;

End.

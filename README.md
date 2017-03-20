# Paradigmas PROLOG
Este repositório contém uma lista de exercícios escritos na linguagem PROLOG

# Sobre
Este repositório foi criado para contribuir com os novos alunos e desenvolvedores que estão começando seus estudos na área de tecnologia, o repositório contém exemplos na linguagem PROLOG

# Lista de Exercícios

  - Lista
    - analisador-sintomas.pro
	
## analisador-sintomas
No início estão declarados todos os sintomas e suas respectivas causas utilizando o seguinte predicado

	sintoma(febre,[causa(gripe),causa(faringite),causa(bronquite),causa(sinusite),
	causa(laringite),causa(pancreatite),causa(febre_reumatica),causa(calculos_renais),
	causa(dengue),causa(meningite),causa(hiv),causa(cancer),causa(sarampo),
	causa(rubeola),causa(leucemia),causa(prostaite)]).

No algoritmo temos os seguintes métodos que compõem a lógica principal com várias sobrecargas

**comparar**

	comparar([],[C|D],X, Z) :- append(X,[],Z).
	
	comparar(A,[], X, Z) :- append(A,[],Z).  
	
	comparar([A|B],[C|D], X, Z) :- findall(A,member(A,C),LF), append(LF,X,Y), comparar(B, [C|D], Y, Z).
  
**descrever_sintomas**

	descrever_sintomas([], Y) :- append(Y,[],Z), medico(Z).
	
	descrever_sintomas([A|B], X) :-	sintoma(A, L), findall(C,member(causa(C),L),LC), append([LC],X,Y), descrever_sintomas(B, Y).

**medico**

	medico([], Z) :- write('Seu(s) sintoma(s) indica(am) que voce pode estar com a(s) seguinte(s) doenca(s): '), write(Z),nl.

	medico([A|B], Z) :- comparar(Z,B,[],X),	medico(B,X).

	medico([A|B]) :- comparar(A,B,[],Z), medico(B, Z).

O método principal para executar o algoritmo é o "dialogo", basta chama-lo e passar uma lista de sintomas

	dialogo :- write('Digite os sintomas que esta sentindo:'), nl,
			   read(Sintoma), nl,           
			   descrever_sintomas(Sintoma, []), nl,
			   write('Deseja realizar uma nova consulta? (1 - Sim; 0 - Nao)'), nl,
			   read(X), X = 1,
			   nl, 
			   dialogo.


# Atualizações
- 2016 Ano de Desenvolvimento

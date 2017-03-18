sintoma(tosse, [causa(sarampo),causa(asma),causa(resfriado),causa(gripe)]).

sintoma(febre,[causa(gripe),causa(faringite),causa(bronquite),causa(sinusite),
causa(laringite),causa(pancreatite),causa(febre_reumatica),causa(calculos_renais),
causa(dengue),causa(meningite),causa(hiv),causa(cancer),causa(sarampo),
causa(rubeola),causa(leucemia),causa(prostaite)]).

sintoma(espirros, [causa(resfriado)]).

sintoma(dor_no_peito, [causa(asma)]).

sintoma(perda_memoria, [causa(alzheimer)]).

sintoma(desmaio, [causa(avc)]).

sintoma(agressividade, [causa(tensao_pre_mestrual)]).

sintoma(visao_turva, [causa(diabetes)]).

sintoma(tristeza, [causa(depressao)]).

sintoma(evacuacao_contante, [causa(diarreia)]).

sintoma(palidez, [causa(anemia)]).

sintoma(palpitacoes, [causa(hipoglicemia)]).

sintoma(pele_ressecada, [causa(hipotireoidismo)]).

sintoma(fome_exagerada, [causa(obesidade)]).

sintoma(secrecao_amarelada, [causa(faringite),causa(sinusite)]).

sintoma(inlamacao_nos_ganglios, [causa(bronquite)]).

sintoma(tosse_seca, [causa(laringite)]).

sintoma(dor_abdominal,[causa(pancreatite),causa(diarreia)]).

sintoma(inflamcao_das_articulacoes,[causa(febre_reumatica)]).

sintoma(vomitos,[causa(calculos_renais),causa(dengue),
causa(meningite),causa(diabetes),causa(hepatite),causa(glaucoma)]).

sintoma(feridas,[causa(hiv)]).

sintoma(desorientacao,[causa(alzheimer)]).

sintoma(tonturas,[causa(avc),causa(anemia),causa(hipoglicemia)]).

sintoma(enjoo,[causa(tensao_pre_mestrual),causa(hepatite)]).

sintoma(perda_de_peso,[causa(cancer)]).

sintoma(apatia,[causa(depressao)]).

sintoma(prisao_de_vente,[causa(hipotireoidismo)]).

sintoma(sono_em_excesso,[causa(obesidade)]).

sintoma(fadiga,[causa(gripe),causa(tensao_pre_mestrual),causa(cancer),causa(diabetes),
causa(anemia),causa(hipoglicemia),causa(hipotireoidismo),causa(obesidade)]).

sintoma(obstrucao_nasal,[causa(resfriado),causa(faringite),causa(sinusite)]).

sintoma(dor_de_garanta,[causa(bronquite)]).

sintoma(garganta_seca,[causa(laringite)]).

sintoma(pressao_arterial_baixa,[causa(pancreatite)]).

sintoma(nodulos_subcutaneos,[causa(febre_reumatica)]).

sintoma(calafrios,[causa(calculos_renais)]).

sintoma(manchas_avermelhadas,[causa(dengue),causa(sarampo),causa(rubeola)]).

sintoma(convulsoes,[causa(meningite)]).

sintoma(falta_de_ar,[causa(asma)]).

sintoma(dor_muscular,[causa(hiv),causa(gripe)]).

sintoma(reducao_de_capacidade_fisica,[causa(alzheimer)]).

sintoma(confusao_mental,[causa(avc)]).

sintoma(falta_de_motivacao,[causa(depressao)]).

sintoma(fezes_liquidas,[causa(diarreia)]).

sintoma(garganta_irritada,[causa(resfriado)]).

sintoma(dor_de_cabeca,[causa(faringite),causa(bronquite),causa(dengue),causa(meningite),
causa(hiv),causa(avc),causa(tensao_pre_mestrual),causa(leucemia),causa(hepatite)]).

sintoma(pressao_ao_redor_dos_olhos,[causa(sinusite)]).

sintoma(rouquidao,[causa(laringite),causa(hipotireoidismo)]).

sintoma(nauseas,[causa(pancreatite),causa(calculos_renais),causa(diabetes),causa(glaucoma)]).

sintoma(rubor_na_pele,[causa(febre_reumatica)]).

sintoma(aperto_no_torax,[causa(asma)]).

sintoma(alteracoes_na_pele,[causa(cancer)]).

sintoma(pessimismo,[causa(depressao)]).

sintoma(vertigens,[causa(anemia)]).

sintoma(tremores,[causa(hipoglicemia)]).

sintoma(suor_em_excesso,[causa(obesidade)]).

sintoma(cosseira,[causa(sarampo)]).

sintoma(aumento_de_ganglios,[causa(rubeola)]).

sintoma(postura_encurvada,[causa(osteoporose)]).

sintoma(dor_pelvica,[causa(infeccao_urinaria),causa(prostaite)]).

sintoma(dor_no_pescoco,[causa(osteoporose)]).

sintoma(urina_com_cheiro_forte,[causa(infeccao_urinaria),causa(cistite)]).

sintoma(visao_diminuida,[causa(glaucoma)]).

sintoma(visao_com_brilho,[causa(catarata)]).

sintoma(falta_de_apetite,[causa(rubeola)]).

sintoma(diminuicao_na_estatura,[causa(osteoporose)]).

sintoma(fraqueza,[causa(leucemia)]).

sintoma(dor_ao_urinar,[causa(prostaite),causa(infeccao_urinaria),causa(cistite)]).

sintoma(visao_dupla,[causa(catarata)]).

sintoma(perda_de_apetite,[causa(hepatite)]).

sintoma(dor_ossea,[causa(osteoporose)]).

sintoma(urina_escura,[causa(infeccao_urinaria)]).

sintoma(sangue_na_urina,[causa(cistite)]).

sintoma(dor_grave_no_olho,[causa(glaucoma)]).

sintoma(visao_nublada,[causa(catarata)]).

comparar([],[C|D],X, Z) :-
append(X,[],Z).

comparar(A,[], X, Z) :-
append(A,[],Z).

comparar([A|B],[C|D], X, Z) :-
findall(A,member(A,C),LF),
append(LF,X,Y),
comparar(B, [C|D], Y, Z).

descrever_sintomas([], Y) :-
append(Y,[],Z),
medico(Z).

descrever_sintomas([A|B], X) :-
sintoma(A, L),
findall(C,member(causa(C),L),LC),
append([LC],X,Y),
descrever_sintomas(B, Y).

medico([], Z) :-
write('Seu(s) sintoma(s) indica(am) que voce pode estar com a(s) seguinte(s) doenca(s): '),
write(Z),nl.

medico([A|B], Z) :-
comparar(Z,B,[],X),
medico(B,X).

medico([A|B]) :-
comparar(A,B,[],Z),
medico(B, Z).

dialogo :- write('Digite os sintomas que esta sentindo:'), nl,
           read(Sintoma), nl,           
           descrever_sintomas(Sintoma, []), nl,
           write('Deseja realizar uma nova consulta? (1 - Sim; 0 - Nao)'), nl,
           read(X), X = 1,
           nl, 
           dialogo.
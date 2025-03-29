% Hechos como listas y estructuras
madre_de([madre_hijo(mona, herbert), madre_hijo(mona, homero), madre_hijo(jacqueline, marge), 
          madre_hijo(jacqueline, patty), madre_hijo(jacqueline, selma), madre_hijo(marge, bart), 
          madre_hijo(marge, lisa), madre_hijo(marge, maggie), madre_hijo(selma, ling)]).

padre_de([padre_hijo(abraham, herbert), padre_hijo(abraham, homero), padre_hijo(homero, bart), 
          padre_hijo(homero, lisa), padre_hijo(homero, maggie), padre_hijo(clancy, marge), 
          padre_hijo(clancy, patty), padre_hijo(clancy, selma)]).

es_hombre([abraham, homero, clancy, herbert, bart]).
es_mujer([mona, jacqueline, marge, lisa, maggie, patty, selma, ling]).

% es_hermano(herman@,herman@).
es_hermano(X,Y) :- 
    madre_de(Madres), 
    padre_de(Padres),
    member(madre_hijo(M,X), Madres), 
    member(madre_hijo(M,Y), Madres), 
    member(padre_hijo(P,X), Padres), 
    member(padre_hijo(P,Y), Padres),
    X \= Y.

% tio_de(tio, sobrin@).
tio_de(X,Y) :- 
    es_hombre(Hombres),
    member(X, Hombres),
    es_hermano(X,Z),
    padre_de(Padres),
    member(padre_hijo(Z,Y), Padres).

% tia_de(tia, sobrin@).
tia_de(X,Y) :- 
    es_mujer(Mujeres),
    member(X, Mujeres),
    es_hermano(X,Z),
    madre_de(Madres),
    member(madre_hijo(Z,Y), Madres).

% sobrino_de(sobrin@, ti@).
sobrino_de(X,Y) :- 
    tia_de(Y,X);
    tio_de(Y,X).

% primo_de(prim@, prim@).
primo_de(X,Y) :- 
    padre_de(Padres),
    member(padre_hijo(Z,X), Padres),
    tio_de(Z,Y);
    madre_de(Madres),
    member(madre_hijo(W,X), Madres),
    tia_de(W,Y).

% abuelo_de(abuel@, niet@).
abuelo_de(X,Y) :- 
    padre_de(Padres),
    member(padre_hijo(X,Z), Padres),
    (padre_de(Padres2), member(padre_hijo(Z,Y), Padres2);
    madre_de(Madres), member(madre_hijo(Z,Y), Madres));
    madre_de(Madres3),
    member(madre_hijo(X,W), Madres3),
    (padre_de(Padres4), member(padre_hijo(W,Y), Padres4);
    madre_de(Madres5), member(madre_hijo(W,Y), Madres5)).
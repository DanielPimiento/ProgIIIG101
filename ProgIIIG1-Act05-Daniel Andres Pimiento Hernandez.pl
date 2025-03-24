madre_de([(mona, herbert), (mona, homero), (jacqueline, marge), (jacqueline, patty), (jacqueline, selma), (marge, bart), (marge, lisa), (marge, maggie), (selma, ling)]).
padre_de([(abraham, herbert), (abraham, homero), (homero, bart), (homero, lisa), (homero, maggie), (clancy, marge), (clancy, patty), (clancy, selma)]).
es_hombre([abraham, homero, clancy, herbert, bart]).
es_mujer([mona, jacqueline, marge, lisa, maggie, patty, selma, ling]).


es_hermano(X,Y) :- 
    madre_de(Madres), 
    padre_de(Padres),
    member((M,X), Madres), 
    member((M,Y), Madres), 
    member((P,X), Padres), 
    member((P,Y), Padres),
    X \= Y.

tio_de(X,Y) :- 
    es_hombre(Hombres),
    member(X, Hombres),
    es_hermano(X,Z),
    padre_de(Padres),
    member((Z,Y), Padres).

tia_de(X,Y) :- 
    es_mujer(Mujeres),
    member(X, Mujeres),
    es_hermano(X,Z),
    madre_de(Madres),
    member((Z,Y), Madres).

sobrino_de(X,Y) :- 
    tia_de(Y,X);
    tio_de(Y,X).

primo_de(X,Y) :- 
    padre_de(Padres),
    member((Z,X), Padres),
    tio_de(Z,Y);
    madre_de(Madres),
    member((W,X), Madres),
    tia_de(W,Y).

abuelo_de(X,Y) :- 
    padre_de(Padres),
    member((X,Z), Padres),
    (padre_de(Padres2), member((Z,Y), Padres2);
    madre_de(Madres), member((Z,Y), Madres));
    madre_de(Madres3),
    member((X,W), Madres3),
    (padre_de(Padres4), member((W,Y), Padres4);
    madre_de(Madres5), member((W,Y), Madres5)).
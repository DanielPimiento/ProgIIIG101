padre(abraham, herbert).
padre(abraham, homero).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, maggie).
padre(homero, lisa).

madre(mona, herbert).
madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, maggie).
madre(marge, lisa).
madre(selma, ling).

hija(lisa, marge).
hija(maggie, marge).
hija(lisa, homero).
hija(maggie, homero).
hija(ling, selma).
hija(patty, clancy).
hija(patty, jacqueline).
hija(selma, clancy).
hija(selma, jacqueline).
hija(marge, clancy).
hija(marge, jacqueline).

hijo(herbert,mona).
hijo(homero,mona).
hijo(herbert,abraham).
hijo(homero,abraham).
hijo(bart,homero).
hijo(bart,marge).

padres(X,Y):- padre(X,Y).
padres(X,Y):- madre(X,Y).

abuelos(X,Y):-padres(X,M), padres(M,Y).
abuelo(X,Y):- padre(X,A), padre(A,Y).
abuelo(X,Y):- padre(X,A), madre(A,Y).
abuela(X,Y):- madre(X,A), madre(A,Y).
abuela(X,Y):- madre(X,A), padre(A,Y).

hijos(X,Y):- padre(Y,X).
hijos(X,Y):- madre(Y,X).

primos(X,Y):- padre(A,X), padre(B, Y),hermanos(A,B).
primos(X,Y):- madre(A,X), madre(B, Y),hermanos(A,B).

tios(X, Y):- hermanos(X, B), hijos(Y, B).  

hermanos(X,Y):- madre(M, X), madre(M, Y), padre(P, X), padre(P, Y), X\=Y.

%pais_enemigo(pais).
pais_enemigo(corea_del_sur).

%estadounidense(ciudadano).

estadounidense(col_west).

arma(misil).

%tiene(pais_enemigo,arma).
tiene(corea_del_sur,misil).

%vendio(persona,arma,pais).
vendio(col_west,misil,corea_del_sur).

criminal(X):-
    estadounidense(X),
    pais_enemigo(Enemigo),
    tiene(Enemigo,Arma),
    arma(Arma),
    vendio(X,Arma,Enemigo).

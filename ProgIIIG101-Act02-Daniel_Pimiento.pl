%conexion(nodo1,nodo2,costo).
%conexion(X,Y,Z).
conexion(s,v1,16).
conexion(s,v2,13).
conexion(v1,v3,12).
conexion(v2,v1,4).
conexion(v2,v4,14).
conexion(v3,v2,9).
conexion(v3,t,20).
conexion(v4,v3,7).
conexion(v4,t,4).
%programa profe
conexiones(X,Y,Z):- 
    conexion(X,Y,Z).
conexiones(X,Y,Z):-conexion(X,W,Z1),
    conexiones(W,Y,Z2),
    Z is Z1 + Z2.
%programa hecho por mi W es el intermedio
costo_entre_nodos(X,W,Y,Z):-
    conexion(X,W,Z1),
    conexion(W,Y,Z2),
    Z is Z1 + Z2.

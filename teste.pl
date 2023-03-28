filiacao(joao,tiago).
filiacao(joao,paula).
filiacao(maria,tiago).
filiacao(maria,paula).
filiacao(tiago,ana).
filiacao(paula,andre).

homem(joao).
homem(tiago).
homem(andre).

mulher(maria).
mulher(paula).
mulher(ana).

pai(X,Y) :- homem(X), filiacao(X,Y). 

mae(X,Y) :- mulher(X), filiacao(X,Y). 

irmaoa(X,Y) :- filiacao(Z,X), filiacao(Z,Y), X \= Y.

tioa(X,Y) :- irmaoa(X,Z), filiacao(Z,Y).

tamanho([],0) :- !.
tamanho([_|Y],C) :- tamanho(Y,Z), C is 1 + Z.

menor([X],X):- !.
menor([H|T],H) :- menor(T,M), M > H, !.
menor([_|T],M) :- menor(T,M).

remove(X,[X|R],R) :- !.
remove(X,[Y|R],[Y|T]) :- remove(X,R,T).

parte([],_,[],[]) :- !.
parte([H|T],X,[H|Me],Ma) :- H < X, parte(T,X,Me,Ma), !.
parte([H|T],X,Me,[H|Ma]) :- parte(T,X,Me,Ma).

qsort([],[]) :- !.
qsort([H|T],L) :- parte(H,T,Me,Ma), 
  qsort(Me,E), qsort(Ma,D), append(E,[H|D],L).


fB(_,[],[]) :- !.
fB(0,_,[]) :- !.
fB(X,[Y|Z],[Y|W]):- T is X-1, fB(T,Z,W).  
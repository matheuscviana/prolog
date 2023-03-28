tamanho([],0).
tamanho([_|Y],C) :- tamanho(Y,Z), C is 1 + Z.

selectionsort([],[]).
selectionsort(L1,[M|L2]) :- menor(L1,M), remove(M,L1,L3), selectionsort(L3,L2).

menor([X],X):- !.
menor([X|R],X) :- menor(R,M), M >= X, !.
menor([X|R],M) :- menor(R,M), M < X.

remove(X,[X|R],R).
remove(X,[Y|R],[Y|T]) :- remove(X,R,T).

particiona([],_,[],[]).
particiona([H|T],X,[H|T2],T3) :- H < X, particiona(T,X,T2,T3).
particiona([H|T],X,T2,[H|T3]) :- H >= X, particiona(T,X,T2,T3).

quicksort([],[]).
quicksort([X|Y],L) :- particiona(Y,X,Esq,Dir),
    quicksort(Esq,Ye), quicksort(Dir,Yd), append(Ye,[X|Yd],L).


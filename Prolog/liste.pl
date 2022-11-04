append([],L,L).
append([X|L],M,[X|N]) :- append(L,M,N).

member(X,  [X|_]).
member(X, [_|T]) :- member(X, T).

remove(_,[],[]).
remove(X, [X|L], L).
remove(X, [Y|L], [Y|M]) :- remove(X, L, M).

removefirst(_,[],[]).
removefirst(X, [X|L], L).
removefirst(X, [Y|L], [Y|M]) :- X\= Y, removefirst(X, L, M).

removeAll(_,[],[]).
removeAll(X, [X|L], L1):- removeAll(X ,L, L1).
removeAll(X, [Y|L], [Y|M]) :- X\= Y, removeAll(X, L, M).

zip([],[],[]).
zip([X|L], [Y|M], [(X,Y)|N]) :- zip(L, M, N).




flatten(X,[X]):-var(X).
flatten(X,[X]):-atomic(X),X\=[].
flatten([],[]).
flatten([H|T], M) :- flatten(H, Hf), flatten(T, Tf), append(Hf, Tf, M).


preorder(leaf, []). 
preorder(node(X, LT, RT), [X|N]) :- preorder(LT, LO), preorder(RT, RO), append( LO, RO, N).

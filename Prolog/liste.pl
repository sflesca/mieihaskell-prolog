append([],L,L).
append([X|L],M,[X|N]) :- append(L,M,N).

member(X,  [X|_]).
member(X, [_|T]) :- member(X, T).

remove(X, [X|L], L).
remove(X, [Y|L], [Y|M]) :- remove(X, L, M).


zip([],[],[]).
zip([X|L], [Y|M], [(X,Y)|N]) :- zip(L, M, N).




flatten(X,[X]):-var(X).
flatten(X,[X]):-atomic(X),X\=[].
flatten([],[]).
flatten([H|T], M) :- flatten(H, Hf), flatten(T, Tf), append(Hf, Tf, M).


preorder(leaf, []). 
preorder(node(X, LT, RT), [X|N]) :- preorder(LT, LO), preorder(RT, RO), append( LO, RO, N).

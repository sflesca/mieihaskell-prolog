maxlists([],[]).
maxlists([X|XS], [Y|YS]) :-  maxL(X,Y), maxlists(XS,YS).

maxL([X], X).
maxL([X|XS], Y) :-  maxL(XS, Z), X<Z, Y is Z,!;
    				Y is X.

figlio(io,tu).
figlio(io,lui).
figlio(tu,lui).
persona(io).
persona(tu).
persona(lui).

nongenitore(X) :- persona(X), \+hafigli(X).
hafigli(X) :- figlio(X,_).

genitoreprolifico(X):- numfigli(X,Y), \+piufigli(Y).
piufigli(N):- numfigli(_,Z), Z>N.

numfigli(X,Y) :- bagof(F,figlio(X,F),L), length(L,Y).
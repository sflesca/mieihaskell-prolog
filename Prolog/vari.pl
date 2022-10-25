callwith(P,Args) :- Atom =.. [P|Args], call(Atom).

map(_,[],[]).
map(P,[X|Xs],[Y|Ys]):- callwith(P,[X,Y]), map(P,Xs,Ys).

plusone(N,M) :- M is N+1.

t([c|L],L).
t([a|L1],M):- t(L1,[b|M]).

t1(L,M) :- L=[c|M].
t1(L,M) :- L = [a|L1], t1(L1,M1), M1 = [b|M].

t2 --> [c].
t2 --> [a], t2, [b].
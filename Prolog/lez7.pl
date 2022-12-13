t([c]).
t(S) :- t(S1), append([a],S1,S2), append(S2,[b],S).

t1([c|L],L).
t1([a|L1],M) :- t1(L1,[b|M]).

t2(L,M) :- L = [c|M].

t2(L,M) :- L = [a|L1], t2(L1,M1),  M1 = [b|M].bort.

t3 --> [c].

t3 --> [a], t3, [b].


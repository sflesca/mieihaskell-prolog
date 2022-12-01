pubb(t1).
pubb(t2).
pubb(t3).
pubb(t4).
pubb(t5).
pubb(t6).
pubb(t7).
pubb(t8).
pubb(t9).
scrive(t1,a1).
scrive(t1,a2).
scrive(t1,a3).
scrive(t2,a1).
scrive(t2,a4).
scrive(t3,a5).
scrive(t3,a2).
scrive(t3,a6).
scrive(t4,e).
scrive(t4,a4).


coautore(X,Y) :- scrive(T, X), scrive(T, Y), X\= Y.

dfs_noloop(Path,Node,[Node|Path]):-goal(Node).
dfs_noloop(Path,Node,Path1):- coautore(Node,Node1), \+ member(Node1,Path), dfs_noloop([Node|Path],Node1,Path1).

goal(e).

erdoslength(X,N) :- dfs_noloop([],X,L), length(L,N).

erdosnum(X,N) :- erdoslength(X,N), \+erdosmax(X,N).

erdosmax(X,N) :- erdoslength(X,N), erdoslength(X,N1), N>N1.
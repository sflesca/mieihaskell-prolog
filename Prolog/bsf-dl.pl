bfs_dl([[Node|Path]|_], _, [Node|Path]) :- goal(Node).
bfs_dl([Path|Paths], Z, Solution) :- extend(Path,NewPaths), append(NewPaths,Z1,Z), Paths\== Z1, bfs_dl(Paths,Z1,Solution).
bfs_dl_start(N,P) :- bfs_dl([[N]|X],X,P).

extend([Node|Path],NewPaths) :- bagof([NewNode,Node|Path], (s(Node,NewNode), \+ (member(NewNode,[Node|Path]))), NewPaths), !.
extend(_Path,[]).

s(a,b).
s(a,c).
s(b,e).
s(c,d).
s(e,d).
s(d,e).
goal(d).
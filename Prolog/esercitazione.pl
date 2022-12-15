team("a").
team("b").
team("c").
team("d").

match("a","b", 1, 0, 0).
match("a","c", 0, 1, 1).
match("d","b", 1, 1, 2).
match("c","a", 1, 1, 3).


    
teamNumbering(T, 1) :- team(T), \+previousTeam(T). 

teamNumbering(T,N) :- team(T), team(T1), T>T1, teamNumbering(T1,N1), N is N1+1.


totalNumberOfTeam(N) :- teamNumbering(_, N), \+tn(N).
tn(N):- teamNumbering(_, N), teamNumbering(_, N1), N<N1.

teams(TL) :- bagof(X,team(X),TL).
totalNumberOfTeam2(N) :- teams(TL), length(TL,N).


unbeated(S):- team(S), \+beated(S).
beated(S):- match(S,_,G1,G2,_), G1<G2.
beated(S):- match(_,S,G1,G2,_), G1>G2.

alwaysLoserwith(S1, S2):- loose(S1,S2), \+winoreven(S1,S2).
    
loose(S1,S2) :- 	match(S1,S2,G1,G2,_), G1<G2 ;
    			match(S2,S1,G2,G1,_), G1<G2 .

winoreven(S1,S2) :- match(S1,S2,G1,G2,_), G1>=G2 ;
    				match(S2,S1,G2,G1,_), G1>=G2 .

winoreven2(S1,P) :- match(S1,_,G1,G2,P), G1>=G2 ;
    				match(_,S1,G2,G1,P), G1>=G2 .

loose2(S1,P) :- 	match(S1,_,G1,G2,P), G1<G2 ;
    			match(_,S1,G2,G1,P), G1<G2 .

notDefeatsBetween(S,P,P1) :- winoreven2(S,P), winoreven2(S,P1), P=<P1, \+defeatedbetween(S,P,P1).
defeatedbetween(S,P1,P2) :- loose2(S,P), P1<P, P<P2.

consecutiveNumberOfNotDefeatsApp(S,P,N) :- bagof(P1, notDefeatsBetween(S,P,P1), L), length(L,N).

consecutiveNumberOfNotDefeats(S,N) :- consecutiveNumberOfNotDefeatsApp(S,_,N).

notlooserecord(S):- consecutiveNumberOfNotDefeats(S,N), \+greaternotloose(S,N).
greaternotloose(S,N):- consecutiveNumberOfNotDefeats(S1,N1), N1>N.


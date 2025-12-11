%% Facts about The Simpsons



% Some unary relations: child, male, female

child(bart).
child(milhouse).
child(lisa).
child(maggie).
child(rod).
child(todd).
child(ralph).

male(abe).
male(homer).
male(bart).
male(ned).
male(rod).
male(todd).
male(chief_wiggum).
male(ralph).
male(milhouse).
male(mr_burns).
male(smithers).
male(groundskeeper_willie).
male(principal_skinner).

female(marge).
female(lisa).
female(maggie).
female(maude).
female(mrs_krabappel).
female(ms_hoover).
female(patty).
female(selma).
female(jacqueline).

% Some binary relations: 
% father, mother, married, friend, neighbor, employs, teaches, catchphrase

father(abe, homer).
father(homer, bart).
father(homer, lisa).
father(homer, maggie).
father(ned, rod).
father(ned, todd).
father(chief_wiggum,ralph).

mother(marge, bart).
mother(marge, lisa).
mother(marge, maggie).
mother(jacqueline, marge).
mother(jacqueline, patty).
mother(jacqueline, selma).
mother(maude, rod).
mother(maude, todd).

married(homer, marge).
married(ned, maude).

friend(bart, milhouse).
friend(bart, maude).
friend(homer, ned).
friend(marge, maude).


neighbor(ned,homer).

employs(mr_burns, homer).
employs(mr_burns, smithers).
employs(principal_skinner, groundskeeper_willie).
employs(principal_skinner, mrs_krabappel).

teaches(ms_hoover, ralph).
teaches(ms_hoover, lisa).
teaches(mrs_krabappel, bart).
teaches(mrs_krabappel, milhouse).

catchphrase(homer, 'D\'oh!').
catchphrase(homer, 'Why you little...!').
catchphrase(marge, 'Hmmmmm...!').
catchphrase(bart, 'Ay caramba!').
catchphrase(bart, 'Don\'t have a cow, man!').
catchphrase(lisa, 'If anyone needs me, I\'ll be in my room.').
catchphrase(ned, 'Okily dokily!').
catchphrase(groundskeeper_willie, 'Bonjour, you cheese-eatin\' surrender monkeys!').
catchphrase(ralph, 'It tastes like...burning!').
catchphrase(mr_burns, 'Eeeeexcellent.').




%% esercizi

%come rendiamo il predicato friend simmetrico??
friend2(X,Y):-friend(Y,X).
friend2(X,Y):-friend(X,Y).

% Scrivere un predicato solitario/ che è vero per le persone che 
% non hanno amici
persona(X) :- male(X).
persona(X) :- female(X).
solitario1(X) :- persona(X), \+friend2(X,_).
solitario(X) :- persona(X), \+friend3(X).
friend3(X):-friend2(X,_).


%scrivere un predicato amicone/1 che è vero per 
%le persone che sono 
%amici di tutte le altre persone.
amicone(X):-persona(X), \+nonamicodiqualcuno(X).
nonamicodiqualcuno(X):-persona(X),persona(Y), X\=Y, \+friend2(X,Y).


listapersone(L):-listapersonenoninlista(L,[]).
listapersonenoninlista([X|L],L1):- persona(X), \+(member(X,L1)), !,
    listapersonenoninlista(L,[X|L1]).
listapersonenoninlista([],_).


listapersone2(L):-setof(X,persona(X),L).
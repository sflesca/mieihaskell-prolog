nodo(a,10).
nodo(b,5).
nodo(c,15).
nodo(d,20).

arco(a,b,2).
arco(b,c,3).
arco(c,d,4).
arco(a,c,5).
arco(b,d,6).

% Regola per calcolare il costo totale di un percorso tra due nodi
valoreraggiungibile(NodoIniziale, NodoFinale, CostoTotale) :-
    percorso(NodoIniziale, NodoFinale, [NodoIniziale], CostoTotale).

% Percorso tra due nodi con accumulo del costo
percorso(Nodo, Nodo, _, V):- nodo(Nodo, V).  % Caso base: stesso nodo
percorso(NodoIniziale, NodoFinale, Visitati, CostoTotale) :-
    arco(NodoIniziale, NodoSuccessivo, CostoArco),
    \+ member(NodoSuccessivo, Visitati),  % Evita cicli
    percorso(NodoSuccessivo, NodoFinale, [NodoSuccessivo|Visitati], CostoRimanente),
    CostoTotale is CostoArco * CostoRimanente.

%valoreraggiungibile(a, c, CostoTotale)

maxVraggiungibile(X,V) :-
    findall(Costo, valoreraggiungibile(X, _, Costo), Costi),
    max_list(Costi, V).

%maxVraggiungibile(a,V)

maxVraggiungibile2(X,V) :-
    valoreraggiungibile(X, _, V), \+ (valoreraggiungibile(X, _, V1), V1>V).

%maxVraggiungibile2(a,V)

studente(sergio, flesca, 6616).
studente(marco, rossi, 1234).
studente(luigi, bianchi, 4321).

corso(0, algoritmi, 6).
corso(1, basiDiDati, 5).
corso(2, retiDiCalcolatori, 4).

esame(6616, 0, 28).
esame(6616, 1, 30).
esame(1234, 0, 25).
esame(4321, 2, 27).

mediapesata(M, V) :- studente(_,_,M),
    findall((Voto,CFU), (esame(M, C, Voto), corso(C, _, CFU)), VotiCFU),
    sum_weighted_scores(VotiCFU, 0, 0, SommaPesi, SommaCFU),
    SommaCFU > 0,
    V is SommaPesi / SommaCFU.

sum_weighted_scores([], SommaPesi, SommaCFU, SommaPesi, SommaCFU).
sum_weighted_scores([(Voto, CFU)|T], AccPesi, AccCFU, SommaPesi, SommaCFU) :-
    NuovoAccPesi is AccPesi + Voto * CFU,
    NuovoAccCFU is AccCFU + CFU,
    sum_weighted_scores(T, NuovoAccPesi, NuovoAccCFU, SommaPesi, SommaCFU).S
% Caso base: lista vuota -> nessun segmento
segmentList([], []).

% Caso generale: iniziamo la costruzione del primo segmento
segmentList([H|T], [Segmento | AltriSegmenti]) :-
    build_segment(T, [H], Segmento, Resto),
    segmentList(Resto, AltriSegmenti).

% build_segment(Restanti, ParzialeInCorso, SegmentoCompleto, RestantiNonUsati)
% Accumula gli elementi finché la crescita è stretta.
build_segment([], Acc, Segmento, []):- reverse(Acc, Segmento).  % fine lista: restituisci l'accumulato ma in ordine inverso

build_segment([X|Xs], [Prev|RestAcc], Segmento, RestoFinale) :-
    X > Prev, !,                        % crescita stretta
    build_segment(Xs, [X,Prev|RestAcc], Segmento, RestoFinale).

build_segment([X|Xs], Acc, Segmento, [X|Xs]) :-
    % crescita interrotta → chiudiamo il segmento
    reverse(Acc, Segmento).

p1(X) :- persona(X,_),
    \+ (
        amico(X, F), femmina(F), persona(F, EtaF),
        amico(X, M), maschio(M), persona(M, EtaM),
        EtaF =< EtaM
    ).

massimale(X, A) :-
    amico(X, A),
    persona(A, EtaA),
    \+ (
        amico(X, B),
        persona(B, EtaB),
        EtaB > EtaA
    ).

p2(X) :- persona(X,_),
    \+ (
        massimale(X, A),
        femmina(A)
    ).

stessaetadegliamici(X) :-
    persona(X, EtaX),
    findall(EtaA, (amico(X, A), persona(A, EtaA)), ListeEta),
    sum_list(ListeEta, Somma),
    EtaX =:= Somma.
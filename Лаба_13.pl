%Задача_11
%Дан целочисленный массив. Найти среднее арифметическое моду-лей его элементов.
lengt([],0):-!.
lengt([_|T], R) :- length(T,I), R is I + 1.

readList(0,[]) :- !.
readList(I,[X|T]) :- write('input - '),read(X), I1 is I - 1, readList(I1, T).

write_list([]) :- !.
write_list([X|T]) :- write(X), nl, write_list(T).

sumAbs([H|T],X):-sumAbs([H|T],X,0).
sumAbs([],X,X):-!.
sumAbs([H|T],X,S):-
    (H>=0->Ns is S+H; Nh is (-1)*H, Ns is S+Nh),
    sumAbs(T,X,Ns).

meanArithmetic([H|T],B):-
    lengt([H|T],K),
    sumAbs([H|T],S),
    B is S/K.

task11:-
    read(N),
    readList(N,L),
    meanArithmetic(L,B),
    print(B).

%Задача_12
%Для введенного списка положительных чисел построить список всех по-ложительных простых делителей элементов списка без повторений.
append([],X,X).
append([X|T],Y,[X|T1]):- append(T,Y,T1).

prost(X,Y):-Nx is X-1,prost(X,Nx,Y,0).
prost(_,1,Z,Z):-!.
prost(X,Nx,Y,Z):-
    Nnx is Nx-1,
    (X mod Nx =:= 0 ->(Nz is Z+1,prost(X,Nnx,Y,Nz));prost(X,Nnx,Y,Z)).

spisokD(X,List):-spisokD(X,X,List,[]).
spisokD(X,1,List,List):-!.
spisokD(X,Nx,ListO,List):-
    Nnx is Nx-1,
    0 is X mod Nx, prost(Nx,A),0 is A, append(List,[Nx],C),spisokD(X,Nnx,ListO,C).
spisokD(X,Nx,ListO,List):-
    Nnx is Nx-1,spisokD(X,Nnx,ListO,List).


in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

unicList(List,List2):- unicList(List,List2,[]).  %лист без повторов
unicList([],List,List):-!.
unicList([H|T],List2,ListNow) :- in_list(ListNow,H), unicList(T,List2,ListNow),!;
    append(ListNow,[H],NewList), unicList(T,List2,NewList).

spisokX([H|T],List):-spisokX([H|T],List,[]).
spisokX([],List,List):-!.
spisokX([H|T],ListO,List):-spisokD(H,L),append(List,L,C),spisokX(T,ListO,C).

task12:-
    read(N),
    readList(N,L),
    spisokX(L,L1),
    unicList(L1,L2),
    write(L2).%Задача_13
%Для введенного списка построить новый с элементами,
%большими, чем среднее арифметическое списка,
%но меньшими, чем его максимальное значе-ние.
maxElem([H|T],El):- maxElem([H|T],H,El).
maxElem([],El,El):-!.
maxElem([H|T],M,El):-
    (H>=M,M1 is H),
    maxElem(T,M1,El);
    maxElem(T,M,El).

sumList([H|T],S):-sumList([H|T],S,0).
sumList([],S,S):-!.
sumList([H|T],S,X):-
    Nx is X+H,sumList(T,S,Nx).

kolList([H|T],S):-kolList([H|T],S,0).
kolList([],S,S):-!.
kolList([H|T],S,X):-
    Nx is X+1,kolList(T,S,Nx).

srAr(List,X):-
    sumList(List,A),kolList(List,B),X is A/B.

nList([H|T],List):-srAr([H|T],K),maxElem([H|T],M),nList([H|T],K,M,List,[]).
nList([],_,_,List,List):-!.
nList([H|T],K,M,ListO,List):-
    H>K,H<M,append(List,[H],C),nList(T,K,M,ListO,C).
nList([H|T],K,M,ListO,List):-nList(T,K,M,ListO,List).

task13:-
    read(N),
    readList(N,L),
    nList(L,List),
    write(List).

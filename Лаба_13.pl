%������_11
%��� ������������� ������. ����� ������� �������������� ����-��� ��� ���������.
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

%������_12
%��� ���������� ������ ������������� ����� ��������� ������ ���� ��-����������� ������� ��������� ��������� ������ ��� ����������.
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

unicList(List,List2):- unicList(List,List2,[]).  %���� ��� ��������
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
    write(L2).

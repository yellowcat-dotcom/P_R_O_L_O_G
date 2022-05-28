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


%14
task14:-
    Color = [_,_,_],
    in_list(Color,[belokurov,_]),
    in_list(Color,[chernov,_]),
    in_list(Color,[ryzhov,_]),
    in_list(Color,[_,blond]),
    in_list(Color,[_,black]),
    in_list(Color,[_,ginger]),
    not(in_list(Color,[belokurov,blond])),
    not(in_list(Color,[chernov,black])),
    not(in_list(Color,[ryzhov,ginger])),
    write(Color),!.


%15
task15:-
    Girls = [_,_,_], %Имя, платье, туфли
    in_list(Girls,[anya,_,_]),
    in_list(Girls,[valya,_,_]),
    in_list(Girls,[natasha,_,_]),
    in_list(Girls,[_,white,_]),
    in_list(Girls,[_,blue,_]),
    in_list(Girls,[_,green,_]),
    in_list(Girls,[_,_,white]),
    in_list(Girls,[_,_,blue]),
    in_list(Girls,[_,_,green]),
    in_list(Girls,[anya,Same,Same]),
    not(in_list(Girls,[valya,Same2,Same2])),
    not(in_list(Girls,[natasha,Same3,Same3])),
    not(in_list(Girls,[valya,_,white])),
    not(in_list(Girls,[valya,white,_])),
    in_list(Girls,[natasha,_,green]),
    write(Girls),!.


%16
task16:-
    %Возраст 0 - 1 - 2
    %имя - должность - возраст - братья/сестры
    Friends = [_,_,_],
    in_list(Friends,[_,slesar,0,0]),
    in_list(Friends,[_,tokar,1,_]),
    in_list(Friends,[_,svarshik,_,_]),
    in_list(Friends,[borisov,_,_,1]),
    in_list(Friends,[ivanov,_,_,_]),
    in_list(Friends,[semenov,_,2,_]),
    not(in_list(Friends,[semenov,tokar,_,_])),
    in_list(Friends,[Name1,slesar,_,_]),
    in_list(Friends,[Name2,tokar,_,_]),
    in_list(Friends,[Name3,svarshik,_,_]),
    write("result Name:"), nl, write("slesar - "), write(Name1),nl,
    write("tokar  - "), write(Name2), nl,
    write("svarshik - "),write(Name3),!.
%17

between(List,X,Y,Z):-leftInList(List,X,Y),rightInList(List,Z,Y);
    leftInList(List,Z,Y),rightInList(List,X,Y).

%X слева от Y
leftInList([_],_,_):-fail.
leftInList([X,Y|_],X,Y).
leftInList([_|List],X,Y):- leftInList(List,X,Y).
%X справа от Y
rightInList([_],_,_):-fail.
rightInList([Y,X|_],X,Y).
rightInList([_|List],X,Y):- rightInList(List,X,Y).

near(List,X,Y):-rightInList(List,Y,X).
near(List,X,Y):-leftInList(List,Y,X).
task17:-
    Jar = [_,_,_,_],
    in_list(Jar,[bottle,_]),
    in_list(Jar,[cup,_]),
    in_list(Jar,[kuvshin,_]),
    in_list(Jar,[banka,_]),
    in_list(Jar,[_,milk]),
    in_list(Jar,[_,water]),
    in_list(Jar,[_,limonad]),
    in_list(Jar,[_,kvas]),
    not(in_list(Jar,[bottle,milk])),
    not(in_list(Jar,[bottle,water])),
    between(Jar,[kuvshin,_],[_,limonad],[_,kvas]),
    not(in_list(Jar,[banka,water])),
    not(in_list(Jar,[banka,limonad])),
    near(Jar,[cup,_],[banka,_]),
    near(Jar,[cup,_],[_,milk]),
    write(Jar),!.

task18:-
    Guys=[_,_,_,_],
    in_list(Guys,[voronov,_]),
    in_list(Guys,[levitskiy,_]),
    in_list(Guys,[pavlov,_]),
    in_list(Guys,[saharov,_]),
    in_list(Guys,[_,dancer]),
    in_list(Guys,[_,artist]),
    in_list(Guys,[_,singer]),
    in_list(Guys,[_,writer]),
    not(in_list(Guys,[voronov,singer])),
    not(in_list(Guys,[levitskiy,singer])),
    not(in_list(Guys,[pavlov,writer])),
    not(in_list(Guys,[pavlov,artist])),
    not(in_list(Guys,[voronov,writer])),
    not(in_list(Guys,[saharov,writer])),
    not(in_list(Guys,[voronov,artist])),
    write(Guys),!.

task19:-
    Sportsman = [_,_,_],
    %нация - имя - спорт - место
    in_list(Sportsman, [_,maikl,basket,_]),
    in_list(Sportsman, [american,_,_,_]),
    in_list(Sportsman,[israel,saimon,_,_]),
    in_list(Sportsman,[_,_,tennis,_]),
    in_list(Sportsman,[_,_,kriket,1]),
    in_list(Sportsman,[_,_,_,2]),
    in_list(Sportsman,[_,_,_,3]),
    in_list(Sportsman,[australian,Name,_,_]),
    in_list(Sportsman,[_,richard,Sport,_]),
    write("Australian is "), write(Name), nl,
    write("Richard sport - "), write(Sport),!.

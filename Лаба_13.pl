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

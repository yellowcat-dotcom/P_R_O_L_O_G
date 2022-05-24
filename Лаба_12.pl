%�������_11
%����� ���������� ��������� �����, �� ��������� �� 3. �������� ����
kolDelNot3(X,K):-kolDelNot3(X,0,0).
kolDelNot3(X,K,X):-!,print(K).
kolDelNot3(X,K,Z):-
     N_Z is Z+1,
    (0 is X mod N_Z, 0 =\= N_Z mod 3 ->N_K is K+1, kolDelNot3(X,N_K,N_Z);kolDelNot3(X,K,N_Z)).
%�������� �����
kolDelNot3_UP(X,K):-kolDelNot3_UP(X,X,K).
kolDelNot3_UP(X,0,K):-!, K is 0.
kolDelNot3_UP(X,Z,K):-
     N_Z is Z-1,
    (0 is X mod Z, 0 =\= Z mod 3 -> kolDelNot3_UP(X,N_Z,Kol), K is Kol+1; kolDelNot3_UP(X,N_Z,K)),!.



%�������_12
%����� ����� ���� ��������� �����, ������� ������� � ������ ���� ����� � �� ������� ������� � ������������� ���� �����.
% 1 - ����� ������������ �����
% 2 - ����� ���� ����� �� ������� ������� � 1 ���=1
% 3 - ����� ���� ����� ������� ������� � 2
pr(X,Y):-pr(X,Y,1).     %������������
pr(0,Y,P):-!,Y is P.
pr(X,Y,P):-
     X1 is X mod 10,
     N_X is X div 10,
     N_P is X1*P,
     pr(N_X,Y,N_P).
%���
nod(X,X,Z):-!,Z is X.
nod(X,Y,Z):-
     N_x is X-Y,
     N_y is Y-X,
     (X>Y->nod(N_x,Y,Z);nod(X,N_y,Z)).

sum(X,Y):- pr(X,P_const),sum(X,Y,0,P_const).
sum(0,Y,S,P_const):-!,Y is S.
sum(X,Y,S,P_const):-
     X1 is X mod 10,
     N_X is X div 10,
     nod(X1,P_const,K),
     (1=\=K->N_S is S+X1,sum(N_X,Y,N_S,P_const);sum(N_X,Y,S,P_const)).

summ(X,Y):-sum(X,SS),summ(X,X,Y,0,SS).   %�������� ��������
summ(X,0,Y,S,SS_const):-!,Y is S.
summ(X,X2,Y,S,SS_const):-
     NX2 is X2-1,
     (0 is X mod X2, nod(SS_const,X2,K), 1 is K -> N_S is S+X2, summ(X,NX2,Y,N_S,SS_const);summ(X,NX2,Y,S,SS_const)).



%�������_13
%����� � 5 �������    ��� ������ ��� ����� �� ������)
stepen_5(X,Y):- Y is X*X*X*X*X.

%���� ����� ����� ��� ������� n >= 7 ����, ����� ���� ���� ���� 9, n * 9^5 ��� ����� ������ ��� �����(������� ������� 10^n).
f(X,Y):-f(X,Y,0).
f(0,Y,S):-!,Y is S.
f(X,Y,S):-
      X1 is X mod 10,  %��������� ����� ���� � ����� �������
     N_X is X div 10,
     stepen_5(X1,L),
     N_S is S+L,
     f(N_X,Y,N_S).

fun(Y):- fun(1000000,Y,0).
fun(1,Y,S):-!,Y is S.
fun(X,Y,S):-
     stepen_5(X,Q),
     f(X,R),
     N_X is X-1,
     %print(Q),nl, print(R),nl,
     (Q =:= R -> N_S=S+X, fun(N_X,Y,N_S);fun(N_X,Y,S)).



%�������_14
%��������� ��������, ���������� ����� ������.
lengt([],0):-!.
lengt([_|T], R) :- length(T,I), R is I + 1.



%��������� ������ � ������ ������
readList(0,[]) :- !.
readList(I,[X|T]) :- write('input - '),read(X), I1 is I - 1, readList(I1, T).

write_list([]) :- !.
write_list([X|T]) :- write(X), nl, write_list(T).



%�������_15
% ��� ������������� ������ � ����������� ������ (�����, ������� �������
% �������). ���������� ���������� �������� �� ������� �� ������-���� ������� ���������� ���������.minList([H|T],Min):-minList([H|T],H,Min).
elbyindex(L,I,El):-elbyindex(L,I,El,0).
elbyindex([H|_],K,H,K):-!.
elbyindex([_|Tail],I,El,Cou):-
    I =:= Cou,
    elbyindex(Tail,Cou,El,Cou);
    Cou1 is Cou + 1,
    elbyindex(Tail,I,El,Cou1).

minElem(L,El):- minElem(L,999999,El).
minElem([],El,El):-!.
minElem([H|T],M,El):-
    (H<M,M1 is H),
    minElem(T,M1,El);
    minElem(T,M,El).

task15:-
    write('input N'),
    read(N),
    readList(N,L),
    read(I),
    elbyindex(L,I,Elind),
    minElem(L,Elmax),
    (Elind =:= Elmax,write(yes);write(no)),!.



%�������_16
%��� ������������� ������.
% ���������� ����������� � �������� ������� �������� �������,
% ������������� ����� ��� ����������� � ������������ ����������.
%
%�������_16
%��� ������������� ������.
% ���������� ����������� � �������� ������� �������� �������,
% ������������� ����� ��� ����������� � ������������ ����������.
append([],X,X).
append([X|T],Y,[X|T1]):- append(T,Y,T1).

maxIndex([H|T],Max,Index_Max):- maxIndex([H|T],H,Max,0,Index_Max,0).
maxIndex([],NowMax,Max,NowIndex,Index_Max,Index):-Max is NowMax,Index_Max is NowIndex,!.
maxIndex([H|T],NowMax,Max,NowIndex,Index_Max,Index):-
    Index1 is Index+1,
    (H >= NowMax,maxIndex(T,H,Max,Index,Index_Max,Index1);maxIndex(T,NowMax,Max,NowIndex,Index_Max,Index1)),!.

minIndex([H|T],Max,Index_Max):- minIndex([H|T],H,Max,0,Index_Max,0).
minIndex([],NowMax,Max,NowIndex,Index_Max,Index):-Max is NowMax,Index_Max is NowIndex,!.
minIndex([H|T],NowMax,Max,NowIndex,Index_Max,Index):-
    Index1 is Index+1,
    (NowMax>= H,minIndex(T,H,Max,Index,Index_Max,Index1);minIndex(T,NowMax,Max,NowIndex,Index_Max,Index1)),!.
take(List,A,B,X):-take(List,A,B,X,[],0).
take([],_,_,X,X,_):-!.
take([H|T],A,B,X,L,C):-C>A,C<B,!,C1 is C+1, append(L,[H],LL),take(T,A,B,X,LL,C1).
take([_|T],A,B,X,L,C):-C1 is C+1,take(T,A,B,X,L,C1).

rev([H|T],X):-rev([H|T],X,[]).
rev([],X,X):-!.
rev([H|T],X,L):-append([H],L,LL),rev(T,X,LL).

min(X,Y,X):-X<Y,!.
min(_,Y,Y).
max(X,Y,X):-X>Y,!.
max(_,Y,Y).

task16:- read(N),readList(N,List), minIndex(List,_,X),maxIndex(List,_,Y),A is X+1,B is Y+1,min(A,B,C),max(A,B,D),
take(List,-1,C,L),lengt(List,K),K1 is K+2,D1 is D-2,take(List,D1,K1,LL),take(List,X,Y,R),rev(R,R1),
    append(L,R1,T),append(T,LL,T1),write_list(T1),!.


lengt([],0):-!.
lengt([_|T], R) :- length(T,I), R is I + 1.

write_list([]) :- !.
write_list([X|T]) :- write(X), nl, write_list(T).




%�������_17
%��� ������������� ������. ���������� �������� ������� ����-������� � ������������ �������� �������.
ff([H|T],L):-minIndex([H|T],Min,MinInd),maxIndex([H|T],Max,MaxInd),ff([H|T],Min,MinInd,Max,MaxInd,0,[],L).
ff([],_,_,_,_,_,L,L):-!.
ff([_|T],Min,MinInd,Max,MaxInd,NowInd,M,L):-
    N_I is NowInd+1,
    NowInd =:=MinInd,!, append(M,[Max],C),ff(T,Min,MinInd,Max,MaxInd,N_I,C,L).

ff([_|T],Min,MinInd,Max,MaxInd,NowInd,M,L):- N_I is NowInd+1,
     NowInd =:=MaxInd,!, append(M,[Min],C),ff(T,Min,MinInd,Max,MaxInd,N_I,C,L).
ff([H|T],Min,MinInd,Max,MaxInd,NowInd,M,L):- N_I is NowInd+1,append(M,[H],C), ff(T,Min,MinInd,Max,MaxInd,N_I,C,L).

tassk17:- read(N),readList(N,List),ff(List,NewList),write_list(NewList),!.



%�������_18
%��� ������������� ������. ���������� ����������� ����������� ����� ��������� ������� ������ �� ���� �������.
%append([],X,X).
%append([X|T],Y,[X|T1]):- append(T,Y,T1).
q([H|T],L):-q(T,L).
q([T],L):-L is T.

write_list1([T]) :- !.
write_list1([X|T]) :- write(X), nl, write_list1(T).
task18:-
      read(N),
      readList(N,List),
      q(List,L),
      append([L],List,NewList),
      write_list1(NewList),!.



%�������_19
%��� ������������� ������. ���������� ����� ���������� ������-��� ����� ������ � ��������� �����������.

yvelElem([H|T],L,Index):-yvelElem([H|T],L,[],Index,0).
yvelElem([],L,L,_,_):-!.
yvelElem([H|T],L,Nl,Index,Count):-
     NC is Count+1,
     (Index =:= Count,append(Nl,[10000],C);append(Nl,[H],C)), yvelElem(T,L,C,Index,NC).
task19(L,Ot):-minIndex(L,X,Y),yvelElem(L,Nl,Y),minIndex(Nl,K,R),D is Y-R,(D<0,D1 is D*(-1),print(D1);print(D)).



%�������_20
%��� ������������� ������ � �������� a..b. ���������� ��������� ������� ������������� �������� ������� � ���� ���������.
ifMaxBetweenAB(List,A,B,Flag):-
    maxIndex(List,Max,_),
    (A<Max,B>Max,Flag is 1;Flag is 0).

task20:-
      read(N),
      readList(N,List),
      read(A),read(B),ifMaxBetweenAB(List,A,B,Flag),write(Flag),!.

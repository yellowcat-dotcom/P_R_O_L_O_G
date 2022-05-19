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

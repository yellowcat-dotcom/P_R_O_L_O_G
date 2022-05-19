%Задание_11
%Найти количество делителей числа, не делящихся на 3. рекурсия вниз
kolDelNot3(X,K):-kolDelNot3(X,0,0).
kolDelNot3(X,K,X):-!,print(K).
kolDelNot3(X,K,Z):-
     N_Z is Z+1,
    (0 is X mod N_Z, 0 =\= N_Z mod 3 ->N_K is K+1, kolDelNot3(X,N_K,N_Z);kolDelNot3(X,K,N_Z)).
%рекурсия вверх
kolDelNot3_UP(X,K):-kolDelNot3_UP(X,X,K).
kolDelNot3_UP(X,0,K):-!, K is 0.
kolDelNot3_UP(X,Z,K):-
     N_Z is Z-1,
    (0 is X mod Z, 0 =\= Z mod 3 -> kolDelNot3_UP(X,N_Z,Kol), K is Kol+1; kolDelNot3_UP(X,N_Z,K)),!.



%Задание_12
%Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа.
% 1 - найти произведение чисел
% 2 - сумму цифр числа НЕ ВЗАИМНО ПРОСТЫХ С 1 НОД=1
% 3 - сумму цифр числа ВЗАИМНО ПРОСТЫХ С 2
pr(X,Y):-pr(X,Y,1).     %Произведение
pr(0,Y,P):-!,Y is P.
pr(X,Y,P):-
     X1 is X mod 10,
     N_X is X div 10,
     N_P is X1*P,
     pr(N_X,Y,N_P).
%НОД
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

summ(X,Y):-sum(X,SS),summ(X,X,Y,0,SS).   %Итоговый предикат
summ(X,0,Y,S,SS_const):-!,Y is S.
summ(X,X2,Y,S,SS_const):-
     NX2 is X2-1,
     (0 is X mod X2, nod(SS_const,X2,K), 1 is K -> N_S is S+X2, summ(X,NX2,Y,N_S,SS_const);summ(X,NX2,Y,S,SS_const)).



%Задание_13
%Число в 5 степень    ЭТУ ЗАДАЧУ МНЕ МОЖНО НЕ ДЕЛАТЬ)
stepen_5(X,Y):- Y is X*X*X*X*X.

%Если число имеет как минимум n >= 7 цифр, тогда даже если цифр 9, n * 9^5 все равно меньше чем число(которое минимум 10^n).
f(X,Y):-f(X,Y,0).
f(0,Y,S):-!,Y is S.
f(X,Y,S):-
      X1 is X mod 10,  %посчитала сумму цифр в пятой степени
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

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

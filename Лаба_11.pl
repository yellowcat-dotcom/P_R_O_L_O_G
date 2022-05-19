%�����, �� ����� �.�.
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%�������_11
% ��������� �������� son(X, Y), ������� ���������, �������� �� X ����� Y.
% ��������� ��������, son(X), ������� ������� ���� X.
son(X,Y):-parent(Y,X), man(X).
son(X):-parent(X,Y),son(Y,X),print(Y),nl,fail.

%�������_12
%������ �������� husband(X, Y), ������� ���������, �������� �� X ����� Y.
%��������� �������� husband(X), ������� ������� ���� X.
husband(X,Y):-parent(X,Z),parent(Y,Z), man(X),woman(Y),!.
husband(X):-husband(Y,X),print(Y),nl,fail.

%�������_13
%���� �������� grand_so(X, Y), ������� ���������, �������� �� X ������ Y.
%��������� �������� grand_sons(X), ������� ������� ���� ������ X.
grand_so(X,Y):-parent(Y,Z),son(X,Z).
grand_sons(X):-grand_so(Y,X),print(Y),nl,fail.

%�������_14
%��������� �������� grand_pa_and_da(X,Y), ������� ���������, �������� �� X � Y �������� � ������� ��� ������� � ��������.
grand_pa_and_da(X,Y):-man(X),parent(X,Z),parent(Z,Y),woman(Y).
grand_pa_and_da(X,Y):-man(Y),parent(Y,Z),parent(Z,X),woman(X).

%�������_15
%����� ������������ ����� �����.�������� �����
maxCifr(X,Y) :- X < 10, Y is X.
maxCifr(X,Y) :-
    N is X mod 10,
    V is X // 10,
    maxCifr(V,C),
    Y is max(N,C).

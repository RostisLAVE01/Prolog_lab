man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(vladimer).
man(viktor).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(vlada).
woman(veolleta).

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
parent(duhovlad,viktor).
parent(duhovlad,veolleta).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


parent(vladimer,duhovlad).
parent(vladimer,velerad).
parent(vlada,duhovlad).
parent(vlada,velerad).

%номер1

%men(?X)
men():- man(X), print(X), nl, fail.
%woman(?X)
women():- woman(X), print(X), nl, fail.
%children(+X)
children(X):- parent(X,Y), print(Y), nl, fail.

%mother(+X,+Y)
mother(X,Y):- woman(X), parent(X,Y).
%mother(+X)
mother(X):- mother(Y,X), print(Y), nl, fail.

%brother(+X,+Y)
brother(X,Y):- man(X), parent(Z,X), man(Z), woman(Y), parent(Z,Y).
%brother(+X)
brother(X):- parent(Z,X), man(Z), parent(Z,Y), man(Y), not(man(X) = man(Y)), print(Y), nl, fail.

%b_s(+X,+Y)
b_s(X,Y):- parent(Z,X), man(Z), parent(Z,Y).
%b_s(+X)
b_s(X):- parent(Z,X), man(Z), parent(Z,Y), not(man(X) = man(Y); woman(X) = woman(Y)), print(Y), nl, fail.


%номер2
%Построить предикат father(X, Y), который проверяет, является ли X отцом Y.
%Построить предикат, father(X), который выводит отца X.
%Построить предикат sister(X, Y), который проверяет, является ли X сестрой Y.
%Построить предикат sisters(X), который выводит всех сестер X.

%father(?X,+Y)
father(X,Y):- parent(X,Y),  man(X).
%father(+X)
father(X):- father(Y,X), print(Y), nl, fail.

%sister(+X,+Y)
sister(X,Y):- woman(X), parent(Z,X), man(Z), parent(Z,Y), not(woman(X) = woman(Y)).
%sister(+X)
sister(X):- woman(X), parent(Z,X), man(Z), parent(Z,Y), woman(Y), not(woman(X) = woman(Y)), print(Y), nl, fail.

%номер3
%Построить предикат grand_pa(X, Y), который проверяет, является ли X дедушкой Y.
%Построить предикат grand_pas(X), который выводит всех дедушек X.
%Построить предикат grand_pa_and_son(X,Y), который проверяет, являются ли X и Y
%дедушкой и внуком или внуком и дедушкой.
%Построить предикат, который проверяет, является ли X дядей Y. Построить
%предикат, который выводит всех дядей X.

%grand_pa(+X,+Y)
grand_pa(X,Y):- man(X), parent(X,Z), parent(Z,Y).
%grand_pa_fk(+X,+Y)
grand_pa_fk(X,Y):- father(X,Y),parent(Y,Z).
%grand_pa(+X)
grand_pas(X):-  parent(Z,X), parent(Y,Z), man(Y), print(Y), nl, fail.

%grand_pa_and_son(+X,+Y)
grand_pa_and_son(X,Y):- parent(X,Z), man(X), parent(Z,Y), man(Y) ; parent(Z,X), man(X), parent(Y,Z), man(Y).

%ДЯДЯ!!!!!
%uncle_fk(+X,+Y)
uncle(X,Y):- parent(Z,Y), parent(S,Z), man(S), parent(S,X), man(X).
%uncle_fk(+X,+Y)
uncle_fk(X,Y):- parent(Z,Y), father(S,Z), father(S,X).
%uncle(+X)
uncle(X):-parent(Z,X), parent(S,Z), man(S), parent(S,Y), man(Y), not(man(Z) = man(Y)),print(Y),nl,fail.
%дописать 3 задание с функциями (это нужно по условию!!!!)






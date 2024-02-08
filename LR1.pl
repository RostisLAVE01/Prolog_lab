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

men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.

mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.


brother(X,Y):- man(X), parent(Z,X), man(Z), woman(Y), parent(Z,Y).
brother(X):- parent(Z,X), man(Z), parent(Z,Y), man(Y), not(man(X) = man(Y)), print(Y), nl, fail.

b_s(X,Y):- parent(Z,X), man(Z), parent(Z,Y).
b_s(X):- parent(Z,X), man(Z), parent(Z,Y), not(man(X) = man(Y); woman(X) = woman(Y)), print(Y), nl, fail.


%номер2

father(X,Y):- parent(X,Y),  man(X).
father(X):- father(Y,X), print(Y), nl, fail.

sister(X,Y):- woman(X), parent(Z,X), man(Z), parent(Z,Y).
sister(X,Y):- woman(X), parent(Z,X), man(Z), parent(Z,Y), woman(Y), not(woman(X) = woman(Y)), print(Y), nl, fail.

%номер3

grand_pa(X,Y):- man(X), parent(X,Y), parent(Y,Z).
grand_pa_fk(X,Y):- father(X,Y),parent(Y,Z).
grand_pa(X):-  parent(Z,X), parent(Y,Z), man(Y), print(Y), nl, fail.

grand_pa_and_son(X,Y):- parent(X,Z), man(X), parent(Z,Y), man(Y) ; parent(Z,X), man(X), parent(Y,Z), man(Y).

%ДЯДЯ!!!!!
uncle(X,Y):- parent(Z,Y), man(Z), parent(S,Z), man(S), parent(S,X), man(X).
uncle_fk(X,Y):- father(Z,Y), father(S,Z), father(S,X).
%uncle(+X)
uncle(X):-parent(Z,X), man(Z), parent(S,Z), man(S), parent(S,Y), man(Y), not(man(Z) = man(Y)),print(Y),nl,fail.
%дописать 3 задание с функциями (это нужно по условию!!!!)

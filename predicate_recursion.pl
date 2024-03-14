man(vova).
man(vitya).
man(vitya2).
man(vitya3).
woman(nina).
woman(lena).
parent(vova,nina).
parent(vova,vitya).
parent(vova,vitya2).
men():- man(X),print(X),nl,fail.
women():- woman(X),print(X),nl,fail.
children(X):- parent(X,Y),print(Y),nl,fail.
mother(X,Y):-woman(X),parent(X,Y).
father(X,Y):-man(X),parent(X,Y).
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y).
max(X,Y,X):- X>Y,!.
max(_,Y,Y).

fact(0,1).
fact(N,X):- N>0,
    N1 is  N-1,
    fact(N1,X1),
    X is X1*N.

fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%chain(+N,-L)
chain(N,L) :- chain(N,0,L).
chain(1,L,L):-!.
chain(N,CurL,L) :- 0 is N mod 2,!, NewN is N div 2,
    NewL is CurL + 1, chain(NewN,NewL,L).
chain(N,CurL,L) :- NewN is 3*N + 1, NewL is CurL + 1,
    chain(NewN,NewL,L).

maxChain(NMaxChain) :- maxChain(1,0,1,NMaxChain).
maxChain(1000000,_,NMaxChain,NMaxChain) :- !.
maxChain(N,CurChain,_,NMaxChain) :- chain(N,L),
    L > CurChain, !, NewN is N + 1, maxChain(NewN,L,N,NMaxChain).
maxChain(N,CurChain,CurN,NMaxChain) :- NewN is N + 1,
    maxChain(NewN,CurChain,CurN,NMaxChain).

%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

concat1([],List,List).
concat1([H|T],List,[H|Tail]) :- concat(T,List,Tail).

sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).

sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.


list_el_numb(List,El,Numb) :- list_el_numb(List,El,Numb,1).
list_el_numb([],_,_,_) :- !,fail.
list_el_numb([El|_],El,Numb,Numb).
list_el_numb([_|T],El,Numb,Ind) :- NewInd is Ind + 1,
    list_el_numb(T,El,Numb,NewInd).


list :- list_el_numb([5,6,7],El,N), write(El),write(' '),write(N),nl,fail.



%Задание 2
%Вариант № 11
%Найти максимальную цифру числа.
%Найти минимальную нечетную цифру числа.
%Найти НОД двух чисел.


%Найти максимальную цифру числа.
%max_cf(+X,-O)
max_cf(0,O,O):-!.
max_cf(X,O):- max_cf(X,0,O). 
max_cf(X,F,O):- X1 is X mod 10,(X1 >= F -> F1 = X1, X2 is X div 10; X2 is X div 10, F1 = F),max_cf(X2,F1,O).  



%Найти минимальную нечетную цифру числа.
%min_n(+X,-O)
min_n(0,O,O):-!. 
min_n(X,O):- min_n(X,9,O).
min_n(X,F,O):- X1 is X mod 10,( X1 < F, 1 is X1 mod 2 -> F1 = X1, X2 is X div 10; X2 is X div 10, F1 = F),min_n(X2,F1,O).



%Найти НОД двух чисел.
%nod(+X,+F,-O)
nod(0,F,O):-!.
nod(X,0,O):-!.
nod(X,F,O):- (X > 0, F > 0 -> (X > F -> X1 is X mod F, F1 = F; F1 is F mod X, X1 = X)),(X1 = 0 ->O = F; X1 = X1,F1 = F1),(F1 = 0 -> O = X; F1 = F1 , X1 = X1), nod(X1,F1,O).





%Задание 3
 
%1.11 Дан целочисленный массив, в котором лишь один элемент отличается от
%остальных. Необходимо найти значение этого элемента.

imposter([Otv], Otv,Prov):-!.
imposter([Head|Tail], Otv):- imposter([Head|Tail], Otv,Prov).
imposter([Head|Tail], Otv,Prov):-
   imposter(Tail, Elem,Prov),
   Elem = Head, Elem = Prov -> Otv = Elem, Prov = Elem; Otv = Head, Prov = Elem.


%1.14 Дан целочисленный массив и интервал a..b. Необходимо найти количество
%элементов в этом интервале.


 kol([],Sum,Sum):-!.
 kol([Head|Tail],Sum):- kol([Head|Tail],Sum,0).
 kol([Head|Tail],Sum,K):- K1 is K + 1, kol(Tail,Sum,K1).

%1.25 Дан целочисленный массив и интервал a..b. Необходимо найти максимальный
%из элементов в этом интервале.


 max_el([Max_e],Max_e):-!.
 max_el([Head|Tail],Max_e):- max_el(Tail,Max_e2), Max_e2 > Head -> Max_e = Max_e2; Max_e = Head.
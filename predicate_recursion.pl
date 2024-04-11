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
%imposter(+[X],-E).
imposter([X], X):-!. 
imposter([], E):-!.
imposter([Y, X, X2 | T], Y):- Y \= X, X = X2,!,E is Y.

imposter([X, X | T], E) :- % когда они одинаковые
   imposter([X | T], E). 

imposter([X, Y | T], E) :- 
                X \= Y,!, % вот это \= будет значит если 2 эл. не равны , то выдаст true: 5\=11 -> true
                E is Y.


%1.14 Дан целочисленный массив и интервал a..b. Необходимо найти количество
%элементов в этом интервале.

%kol(+[X],-Sum).
kol([],Sum,Sum):-!.
kol([Head|Tail],Sum):- kol([Head|Tail],Sum,0).
kol([Head|Tail],Sum,K):- K1 is K + 1, kol(Tail,Sum,K1).

%1.25 Дан целочисленный массив и интервал a..b. Необходимо найти максимальный
%из элементов в этом интервале.

%max_el(+[X],-Max_e).
max_el([Max_e],Max_e):-!.
max_el([Head|Tail],Max_e):- max_el(Tail,Max_e2), Max_e2 > Head -> Max_e = Max_e2; Max_e = Head.





%Найти количество делителей числа, не делящихся на 3
%Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не
%взаимно простых с произведением цифр числа.

%del(+F,-O)
del(F,O):-del(F,O,0,1,0).
del(F,O,Sum,Q,0):- (F =< Q -> RR2 = 1; RR2 = 0), T is F mod Q, J is Q mod 3,(T == 0, J > 0 -> Sum2 is Sum + Q, Q2 is Q + 1; Sum2 is Sum, Q2 is Q + 1), del(F,O,Sum2,Q2,RR2).
del(F,Sum,Sum,Q,1):- !.



%Задачи 41, 48, 53, 59

% 1.41 Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.

sred([H|T],O):- sred([H|T],O,0,0).
sred([H|T],O,Sum,K):- K2 is K + 1, Sum2 is Sum + H, sred(T,O,Sum2,K2).
sred([],O,Sum,K):- O is Sum div K,!. 



%1.48. Для введенного списка построить список с номерами элемента, который повторяется наибольшее число раз.

%number(+[H|T],+N,-Num):
number([],N,N):- !.
number([H|T],N,Num):- (N < H -> N2 is H; N2 is N), number(T,N2,Num).

%places(+[H|T],-Otv)
places([],O,G,F,O):- !.
places([H|T],Otv):- places([H|T],Otv,0,0,[]).
places([H|T],Otv,G,F,O):- number([H|T],F,N), F1 = N, (H == N -> J2 is G + 1, append([J2],O,O2); J2 is G + 1, append([],O,O2)), places(T,Otv,J2,F1,O2).








elem([],O):- !.
elem([H|T],O):- count([H|T],H,Count), length(O,Length), append([Count],O,O2), elem(T,O2).


popa([],F,F):- !.
popa([H|T],O):- popa([H|T],O,0).
popa([H|T],O,G):- number([H|T],0,N),length(O,Length), append([N],O,O2), popa(T,O2,J2).

count([],Value, 0):-!.
count([Head|Tail], Value, Count):- Head = Value, !, count(Tail, Value, TailCount), Count is TailCount + 1.
count([Head|Tail], Value, Count):-count(Tail, Value, TailCount),Count is TailCount.


member(Elem, [Elem|Tail]).
member(Elem, [Head|Tail]):-member(Elem, Tail).


list_to_set([], []):-!.
list_to_set([Head|Tail], [Head|TailSet]):- NOT(member(Head, Tail)), !, list_to_set(Tail, TailSet).
list_to_set([Head|Tail], TailSet):- list_to_set(Tail, TailSet).
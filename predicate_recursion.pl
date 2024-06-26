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




%Задача 5
%Найти количество делителей числа, не делящихся на 3
%Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не
%взаимно простых с произведением цифр числа.

%del(+F,-O)
del(F,O):-del(F,O,0,1,0).
del(F,O,Sum,Q,0):- (F =< Q -> RR2 = 1; RR2 = 0), T is F mod Q, J is Q mod 3,(T == 0, J > 0 -> Sum2 is Sum + Q, Q2 is Q + 1; Sum2 is Sum, Q2 is Q + 1), del(F,O,Sum2,Q2,RR2).
del(F,Sum,Sum,Q,1):- !.




%Задание 6
%Пентагональные числа генерируются по формуле
%P (n)= n (3 n −1) / 2 Первые десять пятиугольных чисел:
%1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
%Видно, что P(4) + P(7) = 22 + 70 = 92 = P 8 . Однако их различие 70 - 22 = 48 не является
%пятиугольным. Найдите пару пятиугольных чисел P j и P k , меньших числа 1000000 для
%которых их сумма и разность пятиугольны и D = | P k - P j | сведено к минимуму; какова
%стоимость D?
%Задача должна быть решена без использования списков.


pentog(P,Otvet):-pentog(P,Otvet,1,2,ZZ,Zaz,0,0,1).
pentog(P,Otvet,F,K,ZZ,Zaz,Kon,Pan,Prov):- form(F,Otv), form(K,Pop), ZZ is Otv + Pop, Zaz is Pop - Otv, form(Prov,Dobbi),
(Dobbi == Zaz, ZZ < 999999 -> Pan1 = 1; Prov2 is Prov + 1),
(Dobbi == ZZ, ZZ < 999999 -> Kon1 = 1; Prov2 is Prov + 1),
(Dobbi > ZZ + 1 -> K2 is K + 1, F2 is F, Prov3 is 1; K2 is K, F2 is F, Prov3 is Prov2),
(ZZ > 999999 -> K1 is F + 2, F1 is F + 1, Prov1 is 1; K1 is K2, F1 is F2, Prov1 is Prov3),
pentog(P,Otvet,F1,K1,ZZ1,Zaz1,Kon1,Pan1,Prov1).
pentog(P,Otvet,P,Otvet,ZZ,Zaz,1,1,Prov):- !.




form(F, O) :- O is F * (3 * F - 1) // 2.

osnova(Ot) :- osnova(Ot, 1, 10000, 0, Summ).
osnova(Ot, I, K, 1, Ot) :- !.
osnova(Ot, I, K, Stop, Summ) :- I =< K, I1 is I + 1, shet(I1, I, O), 
(nonvar(O) -> (nonvar(Summ) -> (O < Summ -> Summ1 = O ; Summ1 = Summ); Summ1 = O ); Summ1 = Summ), osnova(Ot, I1, K, Stop, Summ1).
osnova(Ot, I, K, Stop, Summ) :- I > K, Stop = 1, Summ = Ot.

shet(J, I, O) :- shet(J, I, O, 10000, Max).
shet(J, I, O, D, Max) :- form(I, P), form(J, K), Z is P + K, F is abs(P - K), pen(Z,GG), pen(F,PP),
    (GG > 0 -> (PP > 0 -> ( nonvar(Max) -> (F < Max -> Max1 = F, J1 = J + 1 ; Max1 = Max, J1 = J + 1);  Max1 = F ) ; Max1 = Max, J1 = J + 1) ; Max1 = Max, J1 = J + 1),
    (J1 =< D -> shet(J1, I, O, D, Max1) ; O = Max1).

pen(N, O) :- K1 is 1 + 24 * N, SQ is K1 ** 0.5, Z is (1 + SQ) / 6, (integer(Z) -> O = Z ; O = 0).






%Задача 7
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

count([],Value, 0):-!.
count([Head|Tail], Value, Count):- Head = Value, !, count(Tail, Value, TailCount), Count is TailCount + 1.
count([Head|Tail], Value, Count):-count(Tail, Value, TailCount),Count is TailCount.


member(Elem, [Elem|Tail]).
member(Elem, [Head|Tail]):-member(Elem, Tail).


list_to_set([], []):-!.
list_to_set([Head|Tail], [Head|TailSet]):- NOT(member(Head, Tail)), !, list_to_set(Tail, TailSet).
list_to_set([Head|Tail], TailSet):- list_to_set(Tail, TailSet).









%1.53. Для введенного списка построить новый с элементами, большими, чем среднее
%арифметическое списка, но меньшими, чем его максимальное значение.

tally([H|T],O):- tally([H|T],O,H,0,[]).
tally([H|T],O,K,Ch,Perl):- sred([H|T],Otv), number([H|T],H,N), K1 = N, (Otv > Ch -> Ch1 is Otv + 1;Ch1 is Ch + 1),(K1 > Ch1 -> append([Ch1],Perl,Perl1); Perl1 = Perl), ( K1 > Ch1 -> tally([H|T],O,K1,Ch1,Perl1); tally(T,O,K1,Ch1,Perl1)).
tally([],O,K,Ch,O):- !.


%1.59. Дан список. Построить новый список из квадратов неотрицательных чисел,
%меньших 100 и встречающихся в массиве больше 2 раз.

job([],O,O):- !.
job([H|T],O):- job([H|T],O,[]).
job([H|T],O,B):- count([H|T],H,Count), (Count > 2 -> int_pow(H, H, Pow), way([H|T],H,Otv), append([Pow],B,B2); way([H|T],H,Otv), append([],B,B2)), job(Otv,O,B2).

% Pow = A^B
int_pow(_, 0, 1):-!.
int_pow(A, B, Pow):- B > 0, !, TailB is B - 1, int_pow(A, TailB, TailPow),Pow is TailPow * A.
int_pow(A, B, Pow):- B < 0, !, TailB is B - 1, int_pow(A, TailB, TailPow), Pow is TailPow / A.

way([],Zn,B,B):-!.
way([H|T],Zn,B):-way([H|T],Zn,B,[]).
way([H|T],Zn,B,XX):- (Zn == H -> append([],XX,XX2),Zn2 is Zn;append([H],XX,XX2), Zn2 is Zn), way(T,Zn2,B,XX2).
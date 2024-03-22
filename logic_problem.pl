%Вариант № 11 Воронов, Павлов, Левицкий и Сахаров – четыре талантливых
%молодых человека. Один из них танцор, другой художник, третий-певец, а четвертый-
%писатель. О них известно следующее: Воронов и Левицкий сидели в зале консерватории в
%тот вечер, когда певец дебютировал в сольном концерте. Павлов и писатель вместе
%позировали художнику. Писатель написал биографическую повесть о Сахарове и
%собирается написать о Воронове. Воронов никогда не слышал о Левицком. Кто чем
%занимается?


list([H|_],H).
list([_|T],H):-list(T,H).

main:-People=[_,_,_,_],
    list(People,[voronov,_,_,true]),
    list(People,[pavlov,_,_,_]),
    list(People,[levisci,4,_,true]),
    list(People,[saxarov,_,_,_]),


    list(People,[WHY1,3,poz,false]),
    list(People,[WHY2,_,pell,false]),
    list(People,[WHY3,_,sidel,_]),
    list(People,[WHY4,4,sid,_]),


    write('Пел - '),write(WHY2),nl,
    write('Позировал - '),write(WHY1),nl,
    write('Сидел - '),write(WHY4),nl,
    write('Сидел - '),write(WHY3).


    %in_list
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

pr_ein:-Workers=[_,_,_,_],

        in_list(Workers,[_,_,3,semenov]),
        in_list(Workers,[_,true,_,borisov]),
        in_list(Workers,[_,_,_,ivanov]),


		    in_list(Workers,[tokar,_,2,WHO1]),
		    in_list(Workers,[slesar,false,1,WHO2]),
        in_list(Workers,[svarshik,_,_,WHO3]),
		    write('Tokar - '),write(WHO1),nl,
        write('Slesar - '),write(WHO2),nl,
        write('Svarshik - '),write(WHO3).
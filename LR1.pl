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

%father(+X,+Y)
father(X,Y):- parent(X,Y),  man(X).
%father(+X)
father(X):- father(Y,X), print(Y), nl, fail.

%sister(+X,+Y)
sister(X,Y):- woman(X), parent(Z,X), man(Z), parent(Z,Y).
%sister(+X)
sister(X):- woman(X), parent(Z,X), man(Z), parent(Z,Y), woman(Y), not(woman(X) = woman(Y)), print(Y), nl, fail.

%номер3

%grand_pa(+X,+Y)
grand_pa(X,Y):- man(X), parent(X,Y), parent(Y,Z).
%grand_pa_fk(+X,+Y)
grand_pa_fk(X,Y):- father(X,Y),parent(Y,Z).
%grand_pa(+X)
grand_pa(X):-  parent(Z,X), parent(Y,Z), man(Y), print(Y), nl, fail.

%grand_pa_and_son(+X,+Y)
grand_pa_and_son(X,Y):- parent(X,Z), man(X), parent(Z,Y), man(Y) ; parent(Z,X), man(X), parent(Y,Z), man(Y).

%ДЯДЯ!!!!!
%uncle_fk(+X,+Y)
uncle(X,Y):- parent(Z,Y), man(Z), parent(S,Z), man(S), parent(S,X), man(X).
%uncle_fk(+X,+Y)
uncle_fk(X,Y):- father(Z,Y), father(S,Z), father(S,X).
%uncle(+X)
uncle(X):-parent(Z,X), man(Z), parent(S,Z), man(S), parent(S,Y), man(Y), not(man(Z) = man(Y)),print(Y),nl,fail.
%дописать 3 задание с функциями (это нужно по условию!!!!)


%номер4


main :-
    retractall(asked(_,_)),
    fault(Problem),
    !,
    nl,
    write('The problem is '), write(Problem), write(.), nl.
main :-
    nl,
    write('The problem cannot be recognized.'), nl.

problem(disc_format) :-
    query('Does the computer show error cannot format').

problem(boot_failure) :-
    query('Does the computer show boot failure').

problem(bad_sector) :-
    query('Does the computer show bad sector error').

problem(cannot_read) :-
    query('Does the computer show cannot read from specified device').

problem(long_beep) :-
    query('Is there a long beep during bootup').

problem(short_beep) :-
    query('Is there a short beep during bootup').

problem(two_long_beeps) :-
    query('Are there two long beeps during bootup').

problem(two_short_beeps) :-
    query('Are there two short beeps during bootup').

problem(blank_display) :-
    query('Is there a blank display during bootup').

problem(repeating_short_beeps) :-
    query('Are there repeating short beeps during bootup').

problem(continuous_beeps) :-
    query('Is there a continuous beep during bootup').

problem(no_beep) :-
    query('Is there a beep during bootup').

problem(not_printing) :-
    query('Is there a problem with printing').

problem(missing_dots) :-
    query('Is there a missing character during printing').

problem(non_uniform_printing) :-
    query('Is there uniform printing').

problem(spread_ink) :-
    query('Is there spreading of ink during printing').

problem(paper_jam) :-
    query('Is there a paper jam during printing').

problem(out_of_paper) :-
    query('Is there out-of- paper error during printing').

%новые проблемы...

problem(keys_keyboard) :-
    query('nothing happens when I press keys on the keyboard'). %при нажатии клавишь на клавиатуре ничего не происходит
problem(keyboard_connector) :-
    query('keyboard connector connected to computer'). %подключен разьём клавиатуры в компьютер
problem(keyboard_does_not_work) :-
    query('when I restart the computer the keyboard still does not work'). %при перезагрузке компьютера клавиатура все равно не работает


%моя проблема
fault(keyboard is broken) :-  %клавиатура сломана
    problem(keys_keyboard),
    problem(keyboard_connector),
    problem(keyboard_does_not_work).



fault(power_supply) :-
    problem(repeating_short_beeps),
    problem(continuous_beeps),
    problem(blank_display),
    problem(no_beep).

fault(display_adapter) :-
    problem(long_beep),
    problem(two_short_beeps),
    problem(blank_display),
    problem(no_beep).

fault(motherboard) :-
    problem(long_beep),
    problem(short_beep).

fault(hard_disc) :-
    problem(two_short_beeps),
    problem(blank_display).

fault(booting_problem) :-
    problem(bad_sector),
    problem(boot_failure).

fault(floppy_disk_unusable) :-
    problem(bad_sector),
    problem(cannot_read),
    problem(disc_format).

fault(printer_head) :-
    problem(not_printing),
    problem(missing_dots),
    problem(nonuniform_printing).

fault(ribbon) :-
    problem(not_printing),
    problem(missing_dots),
    problem(spread_ink).

fault(paper) :-
    problem(not_printing),
    problem(paper_jam),
    problem(out_of_paper).

query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.


%номер5 фильмы 


% 1) Вам нравятся камедии
% вы смотрели фильм "Зачётный препод"
% вы смотрели фильм "Супер нянь"
% вы смотрели фильм "Очень страшное кино"
% вы смотрели фильм "Такси"

% 2) Вам нравятся хорроры
% вы смотрели фильм "Звонок"
% вы смотрели фильм "Монахиня"
% вы смотрели фильм "Пила"
% вы смотрели фильм "Астрал"

% 3) Вам нравятся аниме
% вы смотрели фильм по "Ванпис"
% вы смотрели фильм "Унесённые призраками"
% вы смотрели фильм "Ходячий замок"
% вы смотрели фильм "Мери и ведьмин цветок"

% 4) Вам нравятся боевики 
% вы смотрели фильм "Дедпул"
% вы смотрели фильм "Джон Уик"
% вы смотрели фильм "Телохранитель киллера"
% вы смотрели фильм "Мой парень - киллер"

% 5) Вам нравятся фантастика 
% вы смотрели фильм "Валериан и город тысячи планет"
% вы смотрели фильм "Аватар"
% вы смотрели фильм "Пятый элемент"
% вы смотрели фильм "Назад в будущее"

% 6) Вам нравятся мелодрама  
% вы смотрели фильм "Титаник"
% вы смотрели фильм "Предложение"
% вы смотрели фильм "Правила съёма: Метод Хитча"
% вы смотрели фильм "Стажер"







%номер6  



movie :-
    retractall(asked(_,_)),
    genre(Films),
    !,
    nl,
    write('Your favorite genre '), write(Films), write(.), nl.
movie :-
    nl,
    write('You dont have a favorite genre'), nl.

%1

films(super_n) :-
    desc('Have you seen the movie "Super Nanny"').

films(very_scary) :-
    desc('Have you seen the movie "Scary Movie"').

films(taxi) :-
    desc('Have you seen the movie "Taxi"').

films(test_p) :-
    desc('Have you watched the movie "Test Teacher"?').

%2

films(the_ring) :-
    desc('Have you seen the movie "The Ring"').

films(the_nun) :-
    desc('Have you seen the movie "The Nun"').

films(saw) :-
    desc('Have you watched the movie "Saw"').

films(insidious) :-
    desc('Have you watched the movie "Insidious"').

%3

films(one_piece) :-
    desc('Have you seen the movie based on "One Piece"').

films(spirited_away) :-
    desc('Have you seen the movie "Spirited Away"').

films(howls_moving) :-
    desc('Have you watched the movie "Howls Moving Castle"').

films(mary) :-
    desc('Have you seen the movie "Mary and the Witchs Flower"').

%4

films(deadpool) :-
    desc('Have you watched the movie "Deadpool"').

films(john_wick) :-
    desc('Have you watched the movie "John Wick"').

films(the_hitmans) :-
    desc('Have you seen the movie "The Hitmans Bodyguard"').

films(my_boyfriend) :-
    desc('Have you watched the movie "My Boyfriend is a Hitman"').

%5

films(valerian) :-
    desc('Have you seen the movie "Valerian and the City of a Thousand Planets"').

films(avatar) :-
    desc('Have you watched the movie "Avatar"').

films(the_fifth) :-
    desc('Have you seen the movie "The Fifth Element"').

films(back_to_the_future) :-
    desc('Have you seen the movie "Back to the Future"').

%6

films(titanic) :-
    desc('Have you seen the movie "Titanic"').

films(the_proposal) :-
    desc('Have you seen the movie "The Proposal"').

films(rules) :-
    desc('Have you watched the film "Rules of Filming: The Hitch Method"').

films(the_intern) :-
    desc('Have you seen the movie "The Intern"').



genre(comedy) :-
    films(super_n),
    films(very_scary),
    films(taxi),
    films(test_p).

genre(horror) :-
    films(the_ring),
    films(the_nun),
    films(saw),
    films(insidious).

genre(anime) :-
    films(one_piece),
    films(spirited_away),
    films(howls_moving),
    films(mary).

genre(thriller) :-
    films(deadpool),
    films(john_wick),
    films(the_hitmans),
    films(my_boyfriend).

genre(fantastic) :-
    films(valerian),
    films(avatar),
    films(the_fifth),
    films(back_to_the_future).

genre(melodrama) :-
    films(titanic),
    films(the_proposal),
    films(rules),
    films(the_intern).


desc(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.

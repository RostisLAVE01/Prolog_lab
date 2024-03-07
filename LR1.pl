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

%father(+X,+Y)
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






%номер7  

%Модифицировать «Акинатор», реализовав возможность выдачи ответа
%пользователю в случае неполного ответа на вопросы, например для лишь объект X имеет
%текущую картину ответа на 5 вопросов, значит 6 и 7 вопрос задавать необязательно.

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
    films(test_p);
    films(deadpool),
    films(very_scary),
    films(my_boyfriend).

genre(horror) :-
    films(the_ring),
    films(the_nun),
    films(saw),
    films(insidious);
    films(very_scary),
    films(john_wick),
    films(saw),
    films(titanic).

genre(anime) :-
    films(one_piece),
    films(spirited_away);
    films(howls_moving),
    films(mary).

genre(thriller) :-
    films(deadpool),
    films(john_wick),
    films(the_hitmans);
    films(my_boyfriend),
    films(valerian),
    films(avatar).

genre(fantastic) :-
    films(valerian),
    films(avatar),
    films(the_fifth),
    films(back_to_the_future);
    films(avatar),
    films(very_scary),
    films(deadpool).

genre(melodrama) :-
    films(titanic),
    films(the_proposal),
    films(rules),
    films(the_intern);
    films(titanic),
    films(valerian),
    films(my_boyfriend).


desc(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.


%Реализовать возможность разных вопросов для разных объектов, например, 6
%вопросов одинаковых, но, чтобы отличить объект 18 от объекта19 нужен вопрос 7, а чтобы
%отличить объект20 от объекта21, нужен вопрос 8, а остальные объекты отличаются друг от
%друга на основании первых 6 вопросов. Структура должна быть подобрана исходя из
%предметной области.


%1)Вы загадали фильм Дедепулл
% главный герой в красном костюме 
% у главного героя есть катана 
% актер играющий главного героя это Райан Рейнольдс 
% один из жанров этого фильма это боевик 

%2)Вы загадали фильм Главный герой 
% в этом фильме есть супер-способности 
% в этом фильме есть другие миры
% один из главных героев это Джоди Комер 
% один из жанров этого фильма это мелодрама 

%3)Вы загадали фильм Предложение 
% один из жанров этого фильма это мелодрама 
% действия проиходят в реальной мире 
% главный герой работает в книжном издательстве
% главный герой собирается жениться 

%4)Вы загадали фильм телохранитель киллера
% у главного героя опастная работа 
% один из жанров этого фильма это камедия
% главный герой защищает человека 
% актер играющий главного героя это Райан Рейнольдс 

%5)Вы загадали фильм Супер нянь
%главный герой подает в неприятности 
%в фильме показывается компания друзей
%один из жанров этого фильма это камедия
% актер играющий главного героя это Филлип Лашо

%6)Вы загадали фильм Зачётный препод
% главный герой нарушал закон 
% главный герой работает в школе 
% главный герой ищёт клад 
% актер играющий главного героя это Элиаш М'Барек

movie :-
    retractall(asked(_,_)),
    genre(Films),
    !,
    nl,
    write('You wished for a movie '), write(Films), write(.), nl.
movie :-
    nl,
    write('We could not guess the movie'), nl.

%1

films(red) :-
    desc('main character in a red suit').

films(katana) :-
    desc('the main character has a katana').

films(ryan) :-
    desc('the actor playing the main character is Ryan Reynolds').

films(action) :-
    desc('one of the genres of this film is action').

%2

films(super) :-
    desc('There are super powers in this movie').

films(worlds) :-
    desc('there are other worlds in this movie').

films(jodie) :-
    desc('one of the main characters is Jodie Comer').

films(melodrama) :-
    desc('one of the genres of this film is melodrama').

%3

films(alaska) :-
    desc('takes place in Alaska').

films(house) :-
    desc('the main character works in a book publishing house').

films(sandra) :-
    desc('one of the main characters is Sandra Bullock').

films(married) :-
    desc('the main character is going to get married').

%4

films(job) :-
    desc('The main character has a dangerous job').

films(comedy) :-
    desc('one of the genres of this film is comedy').

films(person) :-
    desc('the main character protects a person').

films(samuel) :-
    desc('the actor playing the main character is Samuel').

%5

films(trouble) :-
    desc('the main character gets into trouble').

films(friends) :-
    desc('the film shows the company of friends').

films(phillip) :-
    desc('the actor playing the main character is Phillip Lachaud').

%6

films(law) :-
    desc('the main character broke the law').

films(school) :-
    desc('the main character works at school').

films(treasure) :-
    desc('the main character is looking for treasure').

films(barek) :-
    desc('the actor playing the main character is Elias M,Barek').



genre(deadpool) :-
    films(super),
    films(katana),
    films(red),
    films(action);
    
    films(trouble),
    films(job),
    films(ryan),
    films(law).

genre(main_character) :-
    films(super),
    films(worlds),
    films(jodie),
    films(melodrama);

    films(action),
    films(trouble),
    films(ryan),
    films(jodie).

genre(offer) :- 
    films(alaska),
    films(house);
    films(sandra),  
    films(married).

genre(hitman_is_bodyguard) :-
    films(job),
    films(comedy),
    films(person);
    films(samuel),
    films(action),
    films(law).

genre(super_nannies) :-
    films(trouble),
    films(friends),
    films(phillip);

    films(back_to_the_future),
    films(law),
    films(comedy),

genre(honors_teacher) :-
    films(law),
    films(school),
    films(treasure);
    films(barek),

    films(comedy),
    films(trouble),

desc(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
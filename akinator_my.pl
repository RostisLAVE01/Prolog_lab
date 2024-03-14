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
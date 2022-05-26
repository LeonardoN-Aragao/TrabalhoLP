
:- module(wordListDB, [ 
    attach_word_db/1, add_word/1, current_word/2, set_word/1, del_word/1
    ]).

:- use_module(library(persistency)).

:-persistent word(char:list, length:integer).

del(Word):- retractall_word(Word, _).

attach_word_db(FileName):-
    db_attach(FileName, []).

current_word(Word, _Lenght):-
    word(Word, _Length).

add_word(Word):-
    not(word(Word, _)),
    string_chars(Word,List),
    length(List, S),
    assert_word(List, S).

set_word(Word):-
    word(Word,_),
    del(Word),
    add_word(Word).

del_word(Word):-
    word(Word, _),
    del(Word).



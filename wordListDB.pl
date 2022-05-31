/*
    Trabalho Linguagem de Programação - UFJF
    Gabriel Fortunato - 201665074AC
    Leonardo Nunes - 201665565C
*/
:- module(wordListDB, [ 
    attach_word_db/1, add_word/1, current_word/2, set_word/2, del_word/1
    ]).

:- use_module(library(persistency)).

:-persistent word(char:list, length:integer).

del(Word):- retractall_word(Word, _).

attach_word_db(FileName):-
    db_attach(FileName, []).

current_word(Word, _Length):-
    word(Word, _Length).

add_word(Word):-
    string_chars(Word,List),
    not(word(List, _)),
    length(List, S),
    assert_word(List, S).

set_word(OldWord,Word):-
    word(OldWord,_),
    del(OldWord),
    add_word(Word).

del_word(Word):-
    string_chars(Word,List),
    word(List, _),
    del(List).



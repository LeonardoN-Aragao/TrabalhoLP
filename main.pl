/*
    Trabalho Linguagem de Programação - UFJF
    Gabriel Fortunato - 
    Leonardo Nunes - 201665565C
*/

% Chama persistancy e escolhe arquivo de saida
:-use_module(wordListDB).
:- attach_word_db("wordListDB.txt").

% Adiciona Fatos
code('a', 1).
code('b', 2).
code('c', 3).
code('d', 4).
code('e', 5).
code('f', 6).
code('g', 7).
code('h', 8).
code('i', 9).
code('j', 10).
code('k', 11).
code('l', 12).
code('m', 13).
code('n', 14).
code('o', 15).
code('p', 16).
code('q', 17).
code('r', 18).
code('s', 19).
code('t', 20).
code('u', 21).
code('v', 22).
code('w', 23).
code('x', 24).
code('y', 25).
code('z', 26).
code(' ', 27).

% Cifra In de acordo com a Letra passada
cypher(Letter,In,Out):-
    code(In, X),
    Y is X + Letter,
    Z is Y mod 28,
    code(Out,Z).

% Codigo da Cifra de Cesar
cesar(Char,StringEntrada,ListaSaida):-
    code(Char, Deslocamento),
    (nonvar(StringEntrada) -> 
        string_chars(StringEntrada, L), maplist(cypher(Deslocamento),L,ListaSaida);
        string_chars(ListaSaida,L), maplist(cypher(Deslocamento),StringEntrada,L)    
    ).

% Funções úteis
%string2code(In, Out):- maplist(code(), In, Out).

%generatekeyStream(Word,Length,List):-
%    length(word,L),
%    generatekeyStream(Word, Length, List).

%addLetterInList(H,[],[H]).
%addLetterInList(H,[_ | T],Out):-
%    addLetterInList(H,T,Out).

len([],0).
len([_|T],L):-
    len(T,LT),
    L is LT+1.

append2([],L,L).
append2([H|T],L,[H|TL]) :- append2(T,L,TL).

copy(L,R) :- accCp(L,R).
accCp([],[]).
accCp([H|T1],[H|T2]) :- accCp(T1,T2).

adicionaOqueDa(Word,Length,Out):-
    length(Out,OutLenght),
    length(Word,WordLenght),
    
    R is OutLenght + WordLenght,
    ( R < Length ,
        append(Out,Word,Aux),
        adicionaOqueDa(Word,Length,Aux);
        Resto is Length mod WordLenght,
        copy(Out,Aux),
        adicionaOResto(Resto,Word,Aux,Out)
    ).

adicionaOResto(0,_,_).
adicionaOResto(Resto,[H | T],Aux,Out):-
    string_chars(H,L),
    append(Aux,L,Out),
    R is Resto -1,
    copy(Out,Aux),
    adicionaOResto(R,T,Aux,Out).


vigenere(W1,W2,_Out):-
    length(W2,L2),
    adicionaOqueDa(W1,L2,L1),
    writeln(L1).
    %maplist(cypher(),L1,W2,Out).

process:-
    writeln("----------- Teste Cesar ----------"),
    cesar('a',"leobrabo",ListaSaida),
    string_chars(Frase,ListaSaida),
    writeln(Frase),
    cesar('a',StringEntrada,"mfpcsbcp"),
    string_chars(O,StringEntrada),
    writeln(O),

    guitracer,
    trace,
    writeln("----------- Teste Vinagrete ----------"),
    string_chars("bola",W1),
    string_chars("batata",W2),
    vigenere(W1,W2,Out),
    string_chars(V,Out),
    writeln(V).


:-use_module(wordListDB).
:- attach_word_db("wordListDB.txt").

code(' ', 0).
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

%string2code([H], L):- code(H,Y),addList(Y,L,L).
%string2code([H | T],L):-code(H,Y),addList(Y,L,L),string2code(T,L).

%greater(Z,Y,R):- 
%    (Z < Y, R is Z + Y;
%        Z > Y, R is Z).

cypher(Letter,In,Out):-
    code(In, X),
    Y is X + Letter,
    Z is Y mod 27,
    %greater(Z,32,R),
    code(Out,Z).

caesar(Char,StringEntrada,ListaSaida):-
    code(Char, Deslocamento),
    string_chars(StringEntrada,L),
    writeln(L),
    maplist(cypher(Deslocamento
    ),L,ListaSaida).

process:-
    add_word("abacate"),
    caesar('a',"leobrabo",ListaSaida),
    string_chars(Frase,ListaSaida),
    writeln(Frase).


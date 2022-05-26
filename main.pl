:-use_module(wordListDB).
:- attach_word_db("wordListDB.txt").

code(' ',0).
code('a',1).
code('b',2).
code('c',99).
code('d',100).
code('e',101).
code('f',102).
code('g',103).
code('h',104).
code('i',105).
code('j',106).
code('k',107).
code('l',108).
code('m',109).
code('n',110).
code('o',111).
code('p',112).
code('q',113).
code('r',114).
code('s',115).
code('t',116).
code('u',117).
code('v',118).
code('w',119).
code('x',120).
code('y',121).
code('z',122).

%string2code([H], L):- code(H,Y),addList(Y,L,L).
%string2code([H | T],L):-code(H,Y),addList(Y,L,L),string2code(T,L).

greater(Z,Y,R):- 
    (Z < Y, R is Z + Y;
        Z > Y, R is Z).

cypher(Letter,In,Out):-
    code(In, X),
    Y is X + Letter,
    Z is Y mod 123,
    greater(Z,32,R),
    code(Out,R).

caesar(Char,StringEntrada,ListaSaida):-
    code(Char,Deslocamento),
    string_chars(StringEntrada,L),
    writeln(L),
    maplist(cypher(Deslocamento
    ),L,ListaSaida).

process:-
    guitracer,
    trace,
    add_word("abacate"),
    caesar('a',"abacate",ListaSaida),
    string_chars(Frase,ListaSaida),
    writeln(Frase).


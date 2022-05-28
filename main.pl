:-use_module(wordListDB).
:- attach_word_db("wordListDB.db").

code('a', 0).
code('b', 1).
code('c', 2).
code('d', 3).
code('e', 4).
code('f', 5).
code('g', 6).
code('h', 7).
code('i', 8).
code('j', 9).
code('k', 10).
code('l', 11).
code('m', 12).
code('n', 13).
code('o', 14).
code('p', 15).
code('q', 16).
code('r', 17).
code('s', 18).
code('t', 19).
code('u', 20).
code('v', 21).
code('w', 22).
code('x', 23).
code('y', 24).
code('z', 25).
code(' ', 26).

%string2code([H], L):- code(H,Y),addList(Y,L,L).
%string2code([H | T],L):-code(H,Y),addList(Y,L,L),string2code(T,L).

%greater(Z,Y,R):-
%    (Z < Y, R is Z + Y;
%        Z > Y, R is Z).




/*generatekeyStream(Word,Length,List):-
    length(word,L),
    generatekeyStream(Word, Length, List).*/

addLetterInList(H,[],[H]).
addLetterInList(H,[_ | T],Out):-
    addLetterInList(H,T,Out).

append2([],L,L).
append2([H|T],L,[H|TL]) :- append(T,L,TL).

adicionaOqueDa(_,0,_Out).
adicionaOqueDa(Word,Length,Out):-
    length(Out,OutLenght),
    length(Word,WordLenght),

    R is OutLenght + WordLenght,
    ( R < Length ,
        append2(Out,Word,Aux),
        adicionaOqueDa(Word,Length,Aux);
        Resto is Length mod WordLenght,
        adicionaOResto(Resto,Word,Out)
    ).

        
    

adicionaOResto(0,[_],_Out).
adicionaOResto(Resto,[H | T],Out):-
    string_chars(H,L),
    append2(Out,L,Aux),
    R is Resto -1,
    adicionaOResto(R,T,Aux).

vigenere(W1,W2,Out):-
    length(W2,L2),
    adicionaOqueDa(W1,L2,L1),
    maplist(cypher(),L1,W2,Out).
    

cypher(Letter,In,Out):-
    code(In, X),
    Y is X + Letter,
    Z is Y mod 27,
    %greater(Z,32,R),
    code(Out,Z).

caesar(Char,StringEntrada,ListaSaida):-
    code(Char, Deslocamento),
    string_chars(StringEntrada,L),
    maplist(cypher(Deslocamento),L,ListaSaida).

process:-
    string_chars("batata",W2),
    string_chars("bola",W1),
    vigenere(W1,W2,Out),
    writeln(Out),
    caesar('a',"leobrabo",ListaSaida),
    string_chars(Frase,ListaSaida),
    writeln(Frase).

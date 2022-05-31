/*
    Trabalho Linguagem de Programação - UFJF
    Gabriel Fortunato - 201665074AC
    Leonardo Nunes - 201665565C
*/

% Chama persistancy e escolhe arquivo de saida
:-use_module(wordListDB).
:- attach_word_db("wordListDB.db").

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
string2code(In, Out):- 
    string_chars(In,A),
    maplist(code(), A, Out).

repeat_word(W,1,W).
repeat_word(W,N,L):-
    N1 is N - 1,
    repeat_word(W,N1,L1),
    string_concat(W,L1,L).

generateKeyStream(Word,Length,Out):-
    string_length(Word,WordLength),
    Resto is Length mod WordLength,
    N is (Length-Resto) / WordLength, 
    repeat_word(Word,N,L), 
    sub_string(Word,0,Resto,_,L2),
    string_concat(L, L2, Out).
    
vigenere(W1,W2,Out):-
    (nonvar(W2) -> 
        string_length(W2,L2),
        generateKeyStream(W1,L2,L1),
        string2code(L1,L3),
        string_chars(W2,W3),
        maplist(cypher(),L3,W3,Out);
        
        length(Out,L2),
        generateKeyStream(W1,L2,L1),
        string2code(L1,L3),
        maplist(cypher(),L3,W2,W3),
        string_chars(W3,Out)
    ).

process:-
    writeln("----------- Teste Cesar ----------"),

    cesar('a',"leobrabo",ListaSaida),
    string_chars(Frase,ListaSaida),
    writeln(Frase),
    cesar('a',StringEntrada,"mfpcsbcp"),
    string_chars(O,StringEntrada),
    writeln(O),

    writeln("----------- Teste Vigenere ----------"),

    vigenere("bola","batata",Out),
    writeln(Out),
    vigenere("bola",A,[d,p,d,b,v,p]),
    writeln(A).


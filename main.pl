/*
    Trabalho Linguagem de Programação - UFJF
    Gabriel Fortunato - 201665074AC
    Leonardo Nunes - 201665565C
*/

% Chama persistancy e escolhe arquivo de saida
:-use_module(wordListDB).
:- attach_word_db("wordListDB.db").

% ---------------- Adiciona Fatos ----------------

% Codigo referente aos caracteres minúsculos
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
code(',', 28).
code('?', 29).
code('!', 30).

% Letras mais frequentes
freq(a,0).
freq(e,1).
freq(o,2).
freq(s,3).
freq(r,4).

% ---------------- Funções úteis ----------------

% Cifra Char de acordo com a Key passada.
cypher(Key,Char,Code):-
    code(Char, X),
    Y is X + Key,
    Z is Y mod 32,
    code(Code,Z).

% Retorna uma CodeList de codigos referentes aos caracteres da String de entrada.
string2code(String, CodeList):- 
    string_chars(String,CharList),
    maplist(code(), CharList, CodeList).

% Gera uma String com repetições da palavra de entrada.
repeat_word(Word,1,Word).
repeat_word(Word,TimesToRepeat,Out):-
    Number is TimesToRepeat - 1,
    repeat_word(Word,Number,AuxList),
    string_concat(Word,AuxList,Out).

% Cria uma String repetindo a Word de entrada, até que tenha tamanho igual a Length.
generateKeyStream(Word,Length,Out):-
    string_length(Word,WordLength),
    Remain is Length mod WordLength,
    Number is (Length - Remain) / WordLength, 
    repeat_word(Word,Number,Stream), 
    sub_string(Word,0,Remain,_,String),
    string_concat(Stream, String, Out).

% ---------------- Algoritmos de Cifragem ----------------

% Codigo da Cifra de Cesar.
cesar(Char,String,Out):-
    code(Char, Offset),
    (nonvar(String) ->
        string_chars(String, CharList), maplist(cypher(Offset),CharList,Out);

        string_chars(Out,CharList), maplist(cypher(Offset),String,CharList)    
    ).
    
vigenere(KeyWord,String,Out):-
    (nonvar(String) -> 
        string_length(String,StringSize),
        generateKeyStream(KeyWord,StringSize,KeyStream),
        string2code(KeyStream,CodeList),
        string_chars(String,CharList),
        maplist(cypher(),CodeList,CharList,Out);
        
        length(Out,OutSize),
        generateKeyStream(KeyWord,OutSize,KeyStream),
        string2code(KeyStream,CodeList),
        maplist(cypher(),CodeList,String,List),
        string_chars(List,Out)
    ).

%cesar('b','ana',Q).
%Q = [c, p, c].

/*
cesarBrutalForce(Encoded,Key,String):-
    length(Encoded,Size),
    %FAZER LOOP das freq
    cesar(K1,ALGO,Encoded),
    %FAZER LOOP do BD
    current_word(X,Size),
    ALGO == X
*/

process:-
    writeln("----------- Teste Cesar ----------"),

    cesar('a',"leobrabo",List),
    string_chars(Teste1,List),
    writeln(Teste1),
    cesar('a',String,"mfpcsbcp"),
    string_chars(Teste2,String),
    writeln(Teste2),

    writeln("----------- Teste Vigenere ----------"),

    vigenere("bola","batata",Teste3),
    writeln(Teste3),
    vigenere("bola",Teste4,[d,p,d,b,v,p]),
    writeln(Teste4).

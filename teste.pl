#ASCII
code(' ',32).
code('!',33).
code('"',34).
code('#',35).
code('$',36).
code('%',37).
code('&',38).
code('\'',39).
code('(',40).
code(')',41).
code('*',42).
code('+',43).
code(',',44).
code('-',45).
code('.',46).
code('/',47).
code('0',48).
code('1',49).
code('2',50).
code('3',51).
code('4',52).
code('5',53).
code('6',54).
code('7',55).
code('8',56).
code('9',57).
code(':',58).
code(';',59).
code('<',60).
code('=',61).
code('>',62).
code('?',63).
code('@',64).
code('A',65).
code('B',66).
code('C',67).
code('D',68).
code('E',69).
code('F',70).
code('G',71).
code('H',72).
code('I',73).
code('J',74).
code('K',75).
code('L',76).
code('M',77).
code('N',78).
code('O',79).
code('P',80).
code('Q',81).
code('R',82).
code('S',83).
code('T',84).
code('U',85).
code('V',86).
code('W',87).
code('X',88).
code('Y',89).
code('Z',90).
code('[',91).
code('\\',92).
code(']',93).
code('^',94).
code('_',95).
code('`',96).
code('a',97).
code('b',98).
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

string2code([H], L):- code(H,Y),addList(Y,L,L).
string2code([H | T],L):-code(H,Y),addList(Y,L,L),string2code(T,L),write(L).

/*
auxCaesar([],_,_).
auxCaesar([H | T],X,L):-
    string2Code(H,R),
    write(R),
    add(R,X,R),
    write(R),
    addList(R,L,L1),
    auxCaesar(T,X,L1).
*/

/*
    NOVA VERSÃO

    carrega na memoria fatos
    [bd].

    adiciona no banco
    assert(word(algo)).
*/
list_member(X,[X|_]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

addList(A,T,T):- list_member(A,T),!.
addList(A,T,[A|T]).

remove(A,[A|B],B).
remove(A,[B|C],[B|D]):- remove(A,C,D).

add(A,B,C):-remove(A,C,B).

teste(A,B,[A|B]).

greater(Z,Y,R):- 
    (Z < Y, R is Z + Y;
        Z > Y, R is Z).

cypher(In, Offset, Out):-
    code(In, X),
    Y is X + Offset,
    Z is Y mod 123,
    greater(Z,32,R),
    code(Out,R).

auxCaesar([],_,_). 
auxCaesar([H | T],X,L):- 
    %guitracer,
    %trace,
    cypher(H,X,C),
    addList(C,L,L),
    format('~w -> ~w',[H,C]),
    nl,
    auxCaesar(T,X,L).

caesar(String,X):-
    atom_codes(A, String), 
    atom_chars(A, [H | T]),
    auxCaesar([H | T],X,L),
    string_chars(L,S),
    writeln(S).

process:-
    %cypher('a', 30, X),
    %format('cifrando ~w: ~w', [a, X]),
    %cypher(L, 1,'B'),
    %format('~ndecifrando ~w: ~w', ['B', L]),
    %guitracer,
    %trace,
    %notrace,
    caesar("abacate",5).


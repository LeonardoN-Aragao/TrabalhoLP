# Trabalho Linguagem de Programação - UFJF

    Gabriel Fortunato - 201665074AC
    Leonardo Nunes - 201665565C

## Como testar

Baixar e instalar o Interpretador de Prolog no site -> https://www.swi-prolog.org/Download.html

Utilizar o comando no terminal 'swipl main.pl'

Para Testar os algoritmos de Cifragem utilizar o formato abaixo no console do SWI-Prolog

- cesar(Letra,Frase,Saida)
- vigenere(PalavraChave,Frase,Saida)

## Decisões de projeto

- Somente reconhecer letras minusculas e o espaço.

- Utilizar Codificação com 27 codigos, sendo de 1 a 26 de 'a' a 'z' e ' '(espaço) o 27.

- Salvar as palvras no banco de dados, utilizando uma lista e o seu tamanho, para falicitar procurar palavras de um determinado tamanho.

## Estrategias utilizadas

- Foi utilizada um predicado para cifrar os caracteres individualmente, e para fazer o mesmo com a entrada, foi usado um predicado próprio da linguagem (maplist).

- Também foi utilizada a ideia de condicionais da linguagem para organizar o código dos predicados para funcionar tanto para ida(codificar) quanto para a volta(decodificar).

- Para a função generateKeyStream foi utilizado o predicado da linguagem e concatenado em um loop a frase com ela mesma N vezes.

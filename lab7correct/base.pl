%1 Дана строка. Вывести ее три раза через запятую и показать количе-
%ство символов в ней.

readStr(A) :-
  get0(X),
  readS(X, A, []).
readS(10, A, A) :- !.
readS(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  readS(X1, A, B1).



countN([], Count, Count) :- !.
countN([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  countN(T, CurCount1, Count).
countN(List, Count) :- countN(List, 0, Count).


writeStr([]) :- !.
writeStr([H|T]):-
  put(H),
  writeStr(T).


pr1:-write("Enter your str: "),
     readStr(S),nl,
     write("1: "),
     writeStr(S),nl,
     write("2: "),
     writeStr(S),nl,
     write("3: "),
     writeStr(S),nl,
     write("Count of numbers: "),
     countN(S,C),
     write(C).


%2 Дана строка. Найти количество слов.
numbOfWords([],_,Count):-Count is 1,!.

numbOfWords([H|T],CurCount,Count):-(H =:= 32 -> CurCount is 1, numbOfWords(T,CurCount1,Count1), Count is (Count1 + CurCount);
                                   numbOfWords(T,CurCount,Count)).
numbOfWordsN([],Count):-Count is 0,!.
numbOfWordsN(S,Count):-numbOfWords(S,CurCount,Count).



pr2:-write("Enter your str: "),
     readStr(S),nl,
     numbOfWordsN(S,Count),
     write("Count of wors: "),
     write(Count).


%3 Дана строка, определить самое частое слово
pr3.

%4 Дана строка. Вывести первые три символа и последний три символа,
%если длина строки больше 5 Иначе вывести первый символ столько
%раз, какова длина строки.

countViv(S,-1,S1):-!.
countViv(S,C,S1):-C >= 0,S = [H|T],S1 = [H1|T1],H1 is H,C1 is (C - 1),countViv(S,C1,T1).

newStr3(T,3,T1):-T1 = T,!.
newStr3(T,CN,T1):-T = [H|TT],countN(TT,CCN),newStr3(TT,CCN,T1).

firSec(S,C,S1):-[H1|[H2|[H3|T]]] = S,newStr3(T,C,T1),append([H1,H2,H3],T1,S1).

viv(S,C,S1):-(C > 5 ->(C =:= 6 ->S1 = S;firSec(S,C,S1));countViv(S,C,S1)).


pr4:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     viv(S,C,S1),
     writeStr(S1).



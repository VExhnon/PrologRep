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
     writeStr(S),nl,6
     write("3: "),
     writeStr(S),nl,
     write("Count of numbers: "),
     countN(S,C),
     write(C).


%2 Дана строка. Найти количество слов.
numbOfWords(0,0,Count):-Count is 1,!.
numbOfWords([H|T],CurCount,Count):-(H =:= 32 -> CurCount is 1, numbOfWords(T,CorCount1,Count1), Count is (Count1 + CurCount);(H =:= 10 -> numbOfWords(0,0,Count);numbOfWords(T,CurCount,Count))).

numbOfWordsN(S,Count):-S = [H|T],(H =:= 10 -> Count is 0;numbOfWords(S,CurCount,Count)).



pr2:-write("Enter your str: "),
     readStr(S),nl,
     numbOfWordsN(S,Count),
     write("Count of wors: "),
     write(Count).

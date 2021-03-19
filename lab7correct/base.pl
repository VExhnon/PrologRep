%1 Дана строка. Вывести ее три раза через запятую и показать количе-
%ство символов в ней.
write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).

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

%5 Дана строка. Показать номера символов, совпадающих с последним
%символом строки.

lastNumber(S,1,IND):-IND = S,!.
lastNumber(S,C,IND):-C > 0,C1 is (C - 1),S = [H|T],lastNumber(T,C1,IND).

strIndexes(S,0,IND,S1):-!.
strIndexes(S,C,IND,S1):-C > 0,S = [H|T],(H =:= IND -> S1 = [H1|T1],CurC is (C - 1),H1 is C,strIndexes(T,CurC,IND,T1);CurC is (C - 1),strIndexes(T,CurC,IND,S1)).



pr5:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     lastNumber(S,C,IND),
     C1 is (C-1),
     strIndexes(S,C1,IND,S1),
     writeStr(S1).




%6 Дана строка. Показать третий, шестой, девятый и так далее символы.



  strMod3(_,0,_,_):-!.

  strMod3(S,C,CurC,S1):-C > 0, S = [H|T], (CurC mod 3 =:= 0 -> S1 = [H1|T1],H1 is H, CurC1 is (CurC + 1),C1 is (C - 1),strMod3(T,C1,CurC1,T1);CurC1 is (CurC + 1),C1 is (C - 1),strMod3(T,C1,CurC1,S1)).

  strMod3(S,C,CurC,S1):-CurC is 1, strMod3(S,C,CurC,S1).



pr6:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     strMod3(S,C,0,S1),
     write_list(S1).


%7 Дана строка. Определите общее количество символов '+' и '-' в ней. А
%так же сколько таких символов, после которых следует цифра ноль.



%8 Дана строка. Определите, какой символ в ней встречается раньше: 'x'
%или 'w'. Если какого-то из символов нет, вывести сообщение об этом.
%w - 119      x - 120
strWX(_,0,S1):-S1 is 0,!.
strWX(S,C,S1):-C > 0,S = [H|T],(H =:= 119 -> S1 is 119,!;(H =:= 120 -> S1 is 120,!;C1 is (C - 1),strWX(T,C1,S1))).


pr8:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     strWX(S,C,S1),
     (S1 =:= 0-> write("No X or W in list");(S1 =:= 119 -> write("First in list is 'w'");write("First in list is 'x'"))).

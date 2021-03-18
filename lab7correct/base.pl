%1 ���� ������. ������� �� ��� ���� ����� ������� � �������� ������-
%���� �������� � ���.

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


%2 ���� ������. ����� ���������� ����.
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


%3 ���� ������, ���������� ����� ������ �����
pr3.

%4 ���� ������. ������� ������ ��� ������� � ��������� ��� �������,
%���� ����� ������ ������ 5 ����� ������� ������ ������ �������
%���, ������ ����� ������.

countViv(S,0):-!.
countViv(S,C):-C > 0,S = [H|T],write(H),C1 is (C - 1),countViv(T,C1).

viv(S,C):-(C > 5 -> firSec(S,C);countViv(S,C)).


pr4:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     viv(S,C).



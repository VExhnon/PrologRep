
%21 17 20

%1 ���� ������. ������� �� ��� ���� ����� ������� � �������� ������-
%���� �������� � ���.
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


numStr([], _, _, _) :- write("There's no element with this num"), !.
numStr([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
numStr([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El is H;
  numStr(T, CurNum1, Num, El)).
numStr([H|T], Num, El) :- numStr([H|T], 0, Num, El).

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

%5 ���� ������. �������� ������ ��������, ����������� � ���������
%�������� ������.

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




%6 ���� ������. �������� ������, ������, ������� � ��� ����� �������.



  strMod3(_,0,_,_):-!.

  strMod3(S,C,CurC,S1):-C > 0, S = [H|T], (CurC mod 3 =:= 0 -> S1 = [H1|T1],H1 is H, CurC1 is (CurC + 1),C1 is (C - 1),strMod3(T,C1,CurC1,T1);CurC1 is (CurC + 1),C1 is (C - 1),strMod3(T,C1,CurC1,S1)).

  strMod3(S,C,CurC,S1):-CurC is 1, strMod3(S,C,CurC,S1).



pr6:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     strMod3(S,C,0,S1),
     write_list(S1).


%7 ���� ������. ���������� ����� ���������� �������� '+' � '-' � ���. �
%��� �� ������� ����� ��������, ����� ������� ������� ����� ����.

countPlMi(_,0,Count):-Count is 0,!.
countPlMi(S,C,Count):-C > 0,S = [H|T],(((H =:= 43)|(H =:= 45)) ->( C1 is (C - 1),countPlMi(T,C1,Count1),Count is (Count1 + 1));( C1 is (C - 1),countPlMi(T,C1,Count))).


countPlMi0(_,0,Count):-Count is 0,!.
countPlMi0(S,C,Count):-C > 0,S = [H|T],T = [H1|T1],
                    (((H =:= 43)|(H =:= 45)) ->
                    ( H1 =:= 48 -> C1 is (C - 1),countPlMi0(T,C1,Count1),Count is (Count1 + 1);C1 is (C - 1),countPlMi0(T,C1,Count));
                    ( C1 is (C - 1),countPlMi0(T,C1,Count))).



pr7:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     countPlMi(S,C,C1),
     write(C1),nl,
     countPlMi0(S,C,C2),
     write(C2).


%8 ���� ������. ����������, ����� ������ � ��� ����������� ������: 'x'
%��� 'w'. ���� ������-�� �� �������� ���, ������� ��������� �� ����.
%w - 119      x - 120
strWX(_,0,S1):-S1 is 0,!.
strWX(S,C,S1):-C > 0,S = [H|T],(H =:= 119 -> S1 is 119,!;(H =:= 120 -> S1 is 120,!;C1 is (C - 1),strWX(T,C1,S1))).


pr8:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     strWX(S,C,S1),
     (S1 =:= 0-> write("No X or W in list");(S1 =:= 119 -> write("First in list is 'w'");write("First in list is 'x'"))).


%9 ���� ��� ������. ������� ������� �� ����� ������ ������� ���, ��
%������� �������� ���������� ������.

repeatStr(_,0):-!.
repeatStr(S,C):-C > 0,writeStr(S),nl,C1 is (C - 1),repeatStr(S,C1).

pr9:-write("Enter your str first: "),
     readStr(S1),nl,
     write("Enter your str second: "),
     readStr(S2),nl,
     countN(S1,C1),
     countN(S2,C2),
     (C1 > C2 -> C3 is (C1 - C2),repeatStr(S1,C3);C3 is (C2 - C1),repeatStr(S2,C3)).




%10 ���� ������. ���� ��� ���������� �� 'abc', �� �������� �� �� 'www',
%����� �������� � ����� ������ 'zzz'.

abcEarlyStr([H1|[H2|[H3|T]]]):-(((H1 =:=97),(H2 =:=98),(H3 =:= 99)) -> true;fail).



zzzStr([],CurS,S1):-append(CurS,[122,122,122],S1),!.

zzzStr([H|T],CurS,S1):-append(CurS,[H],CurS1),zzzStr(T,CurS1,S1).

wwwStr1([],CurS,S1):-append(CurS,[],S1),!.
wwwStr1([H],CurS,S1):-append(CurS,[H],S1),!.
wwwStr1([H1|T],CurS,S1):-append(CurS,[H1],CurS1),wwwStr1(T,CurS1,S1).


wwwStr([H1|[H2|[H3|T]]],CurS,S1):-append(CurS,[119,119,119],CurS1),wwwStr1(T,CurS1,S1).

pr10:-write("Enter your str: "),
     readStr(S),nl,
     (abcEarlyStr(S) -> wwwStr(S,CurS,S1);zzzStr(S,CurS,S1)),
     writeStr(S1).


%11 ���� ������. ���� �� ����� ������ 10, �� �������� � ������ ������
%������ 6 ��������, ����� ��������� ������ ��������� 'o' �� �����
%12
% ��������!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% !!

first6Str(S,0,S1):-!.
first6Str(S,C,S1):-C > 0,S = [H|T],S1 = [H1|T1],H1 is H,C1 is (C - 1),first6Str(T,C1,T1).



strWith12o(S,0):-!.


strWith12o([H|T],C):-C > 0,H is 111,C1 is (C - 1),strWith12o(T,C1).


pr11:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C),
     (C > 10 -> C1 is 6,first6Str(S,C1,S1);C2 is 12,C3 is (C2 - C),strWith12o(S2,C3),append(S,S2,S1)),
     writeStr(S1).



%12 ���� ������. ��������� ������ �� ��������� �� ��� ������ ������
%�������. � ������ ��������� ������� ������ �������� �� ������-
%��� ������, �� ����������� �� � ����� �� �������� ����� ����-
%�����. �������� ���������, ������������� �� ��������.


pr12:-write("Enter your str: "),
     readStr(S),nl,
     countN(S,C).


%13 ���� ������. �������� ������ ������ ������ ��� �� 'a', ���� ������
%�� ����� 'a' ��� 'b', ��� �� 'c' � ��������� ������.
%a = 97  b = 98


chetStr([],[]).
chetStr([H|[]],[H]).
chetStr([H,_|T],[H|T1]):-chetStr(T,T1).

zamenaStr(_,0,_):-!.
zamenaStr(S,C,S1):-C > 0,S = [H|T],S1 = [H1|T1], (((H =\= 97),(H =\= 98)) -> H1 is 97,C1 is (C - 1),zamenaStr(T,C1,T1);H1 is 99,C1 is (C - 1),zamenaStr(T,C1,T1)).


pr13:-write("Enter your str: "),
     readStr(S),nl,
     chetStr(S,S1),
     countN(S1,C),

     zamenaStr(S1,C,S2),

     writeStr(S2).


%14 � ������ ������ ����� ���������� ����.

countNumb([], Count) :-Count is 0, !.
countNumb([H|T], Count) :-(((H > 47),(H < 58)) -> countNumb(T, Count1),Count is (Count1 + 1);countNumb(T, Count)).

pr14:-write("Enter your str: "),
     readStr(S),nl,

     countNumb(S,C),

     write(C).



%15 ���� ������. ����������, �������� �� ������ ������ ������� 'a', 'b',
%'c' ��� ���.
%a = 97

abcStr([]):-!.
abcStr(S):-S = [H|T],(((H =:= 97)|(H =:= 98)|(H =:= 99)) -> abcStr(T);fail).


pr15:-write("Enter your str: "),
     readStr(S),nl,
     abcStr(S).


%16 �������� � ������ ��� ��������� 'word' �� 'letter'.


wordStr([H1, H2, H3], CurList, List) :- append(CurList, [H1, H2, H3], List), !.
wordStr([H1, H2], CurList, List) :- append(CurList, [H1, H2], List), !.
wordStr([H1], CurList, List) :- append(CurList, [H1], List), !.
wordStr([], List, List) :- !.
wordStr([H1|[H2|[H3|[H4|T]]]], CurList, List) :-
  ((H1 = 119, H2 = 111, H3 = 114, H4 = 100) ->
  (append(CurList, [108, 101, 116, 116, 101, 114], CurList1),
  wordStr(T, CurList1, List));
  (append(CurList, [H1], CurList1),
  wordStr([H2|[H3|[H4|T]]], CurList1, List))).
wordStr(List, NewList) :- wordStr(List, [], NewList).

pr16 :-
  write("Enter your str: "),
  readStr(S),nl,
  wordStr(S, S1),
  writeStr(S1).



% 17 ������� � ������ ��� ����� 'x'. �� �������� ������� 'abc'.
% x - 120        a - 97



xStr([H1,H2,H3],CurS,S):-append(CurS,[H1,H2,H3],S),!.
xStr([H1,H2],CurS,S):-append(CurS,[H1,H2],S),!.
xStr([H1],CurS,S):-append(CurS,[H1],S),!.


xStr([],S,S):-!.


xStr([H1|[H2|[H3|[H4|T]]]],CurS,S):-((H1 =:= 120, H2 =:= 97, H3 =:=98, H4 =:= 99) -> (append(CurS,[H2,H3,H4],CurS1),xStr(T,CurS1,S));(append(CurS,[H1],CurS1),xStr([H2|[H3|[H4|T]]],CurS1,S))).




pr17 :-
  write("Enter your str: "),
  readStr(S),nl,
  xStr(S,[],S1),
  writeStr(S1).

%18 ������� � ������ ��� 'abc', �� �������� ������� �����.
abcStr([H1,H2,H3],CurS,S):-append(CurS,[H1,H2,H3],S),!.
abc([H1,H2],CurS,S):-append(CurS,[H1,H2],S),!.
abc([H1],CurS,S):-append(CurS,[H1],S),!.


abcStr([],S,S):-!.


abcStr([H1|[H2|[H3|[H4|T]]]],CurS,S):-(((H1 =:= 97, H2 =:=98, H3 =:= 99),(H4 > 47,H4 < 58)) -> (append(CurS,[H4],CurS1),abcStr([H4],CurS1,S));(append(CurS,[H1],CurS1),abcStr([H2|[H3|[H4|T]]],CurS1,S))).




pr18:-
  write("Enter your str: "),
  readStr(S),nl,
  abcStr(S,[],S1),
  writeStr(S1).

%19 ������� ���������� ��������� 'aba' � ������.

abaStr([H1,H2,H3],C):-C is 1,!.
abaStr([H1,H2],C):-C is 0,!.
abaStr([H1],C):-C is 0,!.


abaStr([],C):-C is 0,!.


abaStr([H1|[H2|[H3|T]]],C):-((H1 =:= 97, H2 =:=98, H3 =:= 97) -> (abaStr(T,C1),C is (C1 + 1));(abaStr([H2|[H3|T]],C2),C is C2)).




pr19:-
  write("Enter your str: "),
  readStr(S),nl,
  abaStr(S,Count),
  write(Count).


%21 ���� ������, ��������� �� ����, ����������� ���������, ������� ��-
%��������� �� ������ ������. �������� ��� �����.

twoStr(S1,[],CurS,S):-append(CurS,S1,S),!.
twoStr([H1,H2],[],CurS,S):-append(CurS,[H1,H2],S),!.
twoStr([H1],[],CurS,S):-append(CurS,[H1],S),!.


twoStr([],[],S,S):-!.


twoStr([H1|[H2|T]],[H11|T1],CurS,S):-((H2 =:= H11) -> (append(CurS,[H1,32],CurS1),twoStr(T,T1,CurS1,S));(append(CurS,[H1],CurS1),twoStr([H2|T],[H11|T1],CurS1,S))).




pr21 :-
  write("Enter your 1-st str: "),
  readStr(S1),nl,
  write("Enter your 2-nd str: "),nl,
  readStr(S2),nl,
  twoStr(S1,S2,[],S),
  writeStr(S).


%22 ���� ������. ������� ������, ��������� � ������� (���� �� ����))
%�������.

pr22 :-
  write("Enter your str: "),
  readStr(S),
  countN(S, Count),
  ((0 is Count mod 2) ->
  (F = 0);
  (MidN is (1 + Count) / 2,
  numStr(S, MidN, ElMid),
  F = 1)),
  numStr(S, 1, Left),
  numStr(S, Count, Right),
  (F = 1 ->
  NewS = [Left, ElMid, Right];
  NewS = [Left, Right]),
  writeStr(NewS).





% ������� 20
write_str([]) :- !.
write_str([H|Tail]):-
  put(H),
  write_str(Tail).

firstword([], Word, Word) :- !.
firstword([H|_], Word, Word) :- H = 32, !.
firstword([H|T], CurWord, NewWord) :-
  append(CurWord, [H], CurWord1),
  firstword(T, CurWord1, NewWord).
firstword(List, Word) :- firstword(List, [], Word).

list_nofirstspaces([], []) :- !.
list_nofirstspaces([H|T], [H|T]) :- H \= 32, !.
list_nofirstspaces([_|T], NewList) :- list_nofirstspaces(T, NewList).

firstword_nfs(List, Word) :-
  list_nofirstspaces(List, ListNFS),
  firstword(ListNFS, Word).

list_of_words(List, LW, LW) :-
  list_nofirstspaces(List, ListNFS),
  ListNFS = [], !.
list_of_words(Str, CurLW, LW) :-
  list_nofirstspaces(Str, StrNFS),
  firstword(StrNFS, Word),
  append(Word, StrNoWord, StrNFS),
  append(CurLW, [Word], CurLW1),
  list_of_words(StrNoWord, CurLW1, LW).
list_of_words(Str, LW) :- list_of_words(Str, [], LW).


read_str_nofix(A) :-
  get0(X),
  r_str_nofix(X, A, []).
r_str_nofix(10, A, A) :- !.
r_str_nofix(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_nofix(X1, A, B1).



str_with1space([], Str, Str) :- write("Str hasn\'t words"), !.
str_with1space([H], CurStr, Str) :- append(CurStr, H, Str), !.
str_with1space([H|T], CurStr, Str) :-
  append(H, [32], H1),
  append(CurStr, H1, CurStr1),
  str_with1space(T, CurStr1, Str).
str_with1space(List, Str) :- str_with1space(List, [], Str).

pr20 :-
  write("Str -> "),
  read_str_nofix(S),
  list_of_words(S, Words),
  str_with1space(Words, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").


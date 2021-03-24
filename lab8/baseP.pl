readStr(A) :-
  get0(X),
  readF(X, A, []).
readF(10, A, A) :- !.
readF(-1, A, A) :- !.
readF(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  readF(X1, A, B1).

% ÷èòàåì ñòðîêó
readS(A, N, F) :-
  get0(X),
  rF(X, A, [], N, 0, F).
rF(-1, A, A, N, N, 1) :- !.
rF(10, A, A, N, N, 0) :- !.
rF(X, A, B, N, K, F) :-
  K1 is K + 1,
  append(B, [X], B1),
  get0(X1),
  rF(X1, A, B1, N, K1, F).

% âûâîäèì ñòðîêó
writeStr([]) :- !.
writeStr([H|Tail]) :-
  put(H),
  writeStr(Tail).

% ÷èòàåì íàáîð ñòðîê
readStrF(List) :-
  readS(A, _, Flag),
  readListF([A], List, Flag).
readListF(List, List, 1) :- !.
readListF(Cur_list, List, 0):-
  readS(A, _, Flag),
  append(Cur_list, [A], C_l),
  readListF(C_l, List, Flag).

% âûâîäèì íàáîð ñòðîê
writeStrF([]) :- !.
writeStrF([H|T]) :-
  writeStr(H), nl,
  writeStrF(T).

see0 :- see('D:/swipl/PrologRep/lab8/input.txt').
tell0 :- tell('D:/swipl/PrologRep/lab8/output.txt').




% êîëè÷åñòâî ïðîáåëîâ â ñòðîêå
countSpaces([], Count, Count) :- !.
countSpaces([H|T], CurCount, Count) :-
  (H = 32 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  countSpaces(T, CurCount1, Count).


noSpaceStr([], Count, Count) :- !.
noSpaceStr([H|T], CurCount, Count) :-
  ((countSpaces(H, 0, C), C = 0) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  noSpaceStr(T, CurCount1, Count).

% Çàäàíèå 1.1
countN([], Count, Count) :- !.
countN([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  countN(T, CurCount1, Count).
countN(List, Count) :- countN(List, 0, Count).


maxCountStr([],MAX,MAX):-!.
maxCountStr([H|T],CurMax,MAX):-countN(H,Count),
                              (Count > CurMax -> CurMax1 is Count;CurMax1 is CurMax),
                               maxCountStr(T,CurMax1,MAX).



maxCountStr(S,MAX):-maxCountStr(S,0,MAX).

pr1_1:-
    see0,readStrF(S),nl,
    maxCountStr(S,MAX),seen,
    write(MAX).

    %
%2 Дан файл. Определить, сколько в файле строк, не содержащих
%пробелы.

pr1_2:-
    see0,readStrF(S),nl,
    noSpaceStr(S,0,Count),seen,
    write(Count).


%3 Дан файл, найти и вывести на экран только те строки, в которых букв
%А больше, чем в среднем на строку.

meanLittleStr([],M,M):-!.
meanLittleStr([H|T],CurM,M):-(H =:= 65 -> CurM1 is (CurM + 1),meanLittleStr(T,CurM1,M);meanLittleStr(T,CurM,M)).

meanStr([],M,M):-!.
meanStr([H|T],CurM,Mean):-meanLittleStr(H,0,MeanLittle),CurM1 is (CurM + MeanLittle),meanStr(T,CurM1,Mean).

meanStr(S,Mean):-meanStr(S,0,Mean1),countN(S,Count),Mean is (Mean1 / Count).


writeMeanStr([],_):-!.
writeMeanStr([H|T],Mean):-meanLittleStr(H,0,M),(M > Mean -> writeStr(H),nl,writeMeanStr(T,Mean);writeMeanStr(T,Mean)).


pr1_3:-
    see0,readStrF(S),nl,
    meanStr(S,Mean),seen,
    writeMeanStr(S,Mean).

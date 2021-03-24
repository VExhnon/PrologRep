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
count_spaces([], Count, Count) :- !.
count_spaces([H|T], CurCount, Count) :-
  (H = 32 ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_spaces(T, CurCount1, Count).


count_lines_without_spaces([], Count, Count) :- !.
count_lines_without_spaces([BigH|BigT], CurCount, Count) :-
  ((count_spaces(BigH, 0, C), C = 0) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_lines_without_spaces(BigT, CurCount1, Count).

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

pr1:-
    see0,readStrF(S),nl,
    maxCountStr(S,MAX),seen,
    write(MAX).


read_str_nofix(A) :-
  get0(X),
  r_str_nofix(X, A, []).
r_str_nofix(10, A, A) :- !.
r_str_nofix(-1, A, A) :- !.
r_str_nofix(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_nofix(X1, A, B1).

% ÷èòàåì ñòðîêó
read_str(A, N, Flag) :-
  get0(X),
  r_str(X, A, [], N, 0, Flag).
r_str(-1, A, A, N, N, 1) :- !.
r_str(10, A, A, N, N, 0) :- !.
r_str(X, A, B, N, K, Flag) :-
  K1 is K + 1,
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1, N, K1, Flag).

% âûâîäèì ñòðîêó
write_str([]) :- !.
write_str([H|Tail]) :-
  put(H),
  write_str(Tail).

% ÷èòàåì íàáîð ñòðîê
read_list_str(List) :-
  read_str(A, _, Flag),
  read_list_str([A], List, Flag).
read_list_str(List, List, 1) :- !.
read_list_str(Cur_list, List, 0):-
  read_str(A, _, Flag),
  append(Cur_list, [A], C_l),
  read_list_str(C_l, List, Flag).

% âûâîäèì íàáîð ñòðîê
write_list_str([]) :- !.
write_list_str([H|T]) :-
  write_str(H), nl,
  write_list_str(T).


random_list_chrs([H1, H2], CurList, List) :-
  ((0 is (H1 + H2) mod 3) ->
  append(CurList, [H1, H2], List);
  append(CurList, [H2, H1], List)), !.
random_list_chrs([H1], CurList, List) :-
  ((0 is H1 mod 3) ->
  append(CurList, [H1], List);
  append([H1], CurList, List)), !.
random_list_chrs([], List, List) :- !.
random_list_chrs([H1|[H2|[H3|T]]], CurList, List) :-
  ((0 is (H1 + H2 + H3) mod 3) ->
  append(CurList, [H3, H1, H2], CurList1);
  append(CurList, [H2, H3, H1], CurList1)),
  random_list_chrs(T, CurList1, List).
random_list_chrs(List, NewList) :- random_list_chrs(List, [], NewList).

% ìåøàåì â êàæäîì ñëîâå ñèìâîëû ìåæäó ïåðâûì è ïîñëåäíèì
words_rnd_chrs([], Words, Words) :- !.
words_rnd_chrs([H|T], CurWords, Words) :-
  count_els(H, Count),
  ((Count >= 1, Count =< 3) ->
  append(CurWords, [H], CurWords1);
  (append([First|HNoFirstNoLast], [Last], H),
  random_list_chrs(HNoFirstNoLast, RandomList),
  append([First|RandomList], [Last], RandomH),
  append(CurWords, [RandomH], CurWords1))),
  words_rnd_chrs(T, CurWords1, Words).
words_rnd_chrs(Words, NewWords) :- words_rnd_chrs(Words, [], NewWords).

% ñîñòàâèì ñïèñîê ñëîâ
% äàëåå áóäåò âûòàñêèâàòü ñëîâî èç ñïèñêà è ñòàâèòü ïîñëå íåãî ïðîáåë
% ïîñëå ïîñëåäíåãî ñëîâà ñïèñêà ïðîáåë íå ñòàâèì
str_with1space([], Str, Str) :- write("Str hasn\'t words"), !.
str_with1space([H], CurStr, Str) :- append(CurStr, H, Str), !.
str_with1space([H|T], CurStr, Str) :-
  append(H, [32], H1),
  append(CurStr, H1, CurStr1),
  str_with1space(T, CurStr1, Str).
str_with1space(List, Str) :- str_with1space(List, [], Str).

t2_6 :-
  write("Str -> "),
  read_str_nofix(S),
  list_of_words(S, LW),
  words_rnd_chrs(LW, RLW),
  str_with1space(RLW, NewS),
  write("New Str => ["),
  write_str(NewS),
  write("]").

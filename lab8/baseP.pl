%2.16  3 4.16 5 6 7 8.3
read_str_nofix(A) :-
  get0(X),
  r_str_nofix(X, A, []).
r_str_nofix(10, A, A) :- !.
r_str_nofix(-1, A, A) :- !.
r_str_nofix(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str_nofix(X1, A, B1).

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

write_str([]) :- !.
write_str([H|Tail]) :-
  put(H),
  write_str(Tail).

read_list_str(List) :-
  read_str(A, _, Flag),
  read_list_str([A], List, Flag).
read_list_str(List, List, 1) :- !.
read_list_str(Cur_list, List, 0):-
  read_str(A, _, Flag),
  append(Cur_list, [A], C_l),
  read_list_str(C_l, List, Flag).

write_list_str([]) :- !.
write_list_str([H|T]) :-
  write_str(H), nl,
  write_list_str(T).


count_els([], Count, Count) :- !.
count_els([_|T], CurCount, Count) :-
  CurCount1 is CurCount + 1,
  count_els(T, CurCount1, Count).
count_els(List, Count) :- count_els(List, 0, Count).

ls_num_el([H], El, CurNum, Num) :-
  ((H = El) ->
  Num is CurNum + 1;
  write("Such element isn\'t found")), !.
ls_num_el([H|T], El, CurNum, Num) :-
  CurNum1 is CurNum + 1,
  ((El = H) ->
  Num is CurNum1;
  ls_num_el(T, El, CurNum1, Num)).
ls_num_el([H|T], El, Num) :- ls_num_el([H|T], El, 0, Num).


ls_el_at_num([], _, _, _) :- write("Such element isn\'t found"), !.
ls_el_at_num([_], CurNum, Num, _) :-
  CurNum1 is CurNum + 1,
  CurNum1 < Num,
  write("Such element isn\'t found"), !.
ls_el_at_num([H|T], CurNum, Num, El) :-
  CurNum1 is CurNum + 1,
  ((CurNum1 is Num) ->
  El = H;
  ls_el_at_num(T, CurNum1, Num, El)).
ls_el_at_num([H|T], Num, El) :- ls_el_at_num([H|T], 0, Num, El).

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


firstword([], Word, Word) :- !.
firstword([H|_], Word, Word) :- H = 32, !.
firstword([H|T], CurWord, NewWord) :-
  append(CurWord, [H], CurWord1),
  firstword(T, CurWord1, NewWord).
firstword(List, Word) :- firstword(List, [], Word).

% ïîëó÷àåì ïåðâîå ñëîâî íåñìîòðÿ íà ïðîáåëû
firstword_nfs(List, Word) :-
  list_nofirstspaces(List, ListNFS),
  firstword(ListNFS, Word).

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

list_nofirstspaces([], []) :- !.
list_nofirstspaces([H|T], [H|T]) :- H \= 32, !.
list_nofirstspaces([_|T], NewList) :- list_nofirstspaces(T, NewList).


list_of_words_file([], LWF, LWF) :- !.
list_of_words_file([H|T], CurLWF, LWF) :-
  list_of_words(H, LW),
  append(CurLWF, LW, CurLWF1),
  list_of_words_file(T, CurLWF1, LWF).
list_of_words_file(ListOfLines, LWF) :- list_of_words_file(ListOfLines, [], LWF).

rm_el([_|T], CurList, Num, Num, NewList) :- append(CurList, T, NewList), !.
rm_el([H|T], CurList, CurNum, Num, NewList) :-
  append(CurList, [H], CurList1),
  CurNum1 is CurNum + 1,
  rm_el(T, CurList1, CurNum1, Num, NewList).
rm_el(List, Num, NewList) :- rm_el(List, [], 1, Num, NewList).

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


%4Дан файл, вывести самое частое слово.



skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).




get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).





get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).


unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

writewrite([H|[]]):-writeStr(H),!.
writewrite([H|T]):-writeStr(H),nl,writewrite(T).
%список всех слов
getWordsStr([H|[]],CurStr,Str):-get_words(H,WORDS,K),append(CurStr,WORDS,CurStr1),Str = CurStr1,!.

getWordsStr([H|T],CurStr,Str):-get_words(H,WORDS,K),append(CurStr,WORDS,CurStr1),getWordsStr(T,CurStr1,Str).

getWordsStr(S,Words):-getWordsStr(S,[],Words).

sravStr([H1|[]],[H|[]]):-(H1 =:= H -> true,!;fail,!).
sravStr([H1|T1],[H|T]):-(H1 =:= H -> sravStr(T1,T);fail,!).


ccc([H|[]],H1,Count,CurCount):-(sravStr(H1,H) ->Count is (CurCount + 1),!;Count is CurCount,!).
ccc([H|T],H1,Count,CurCount):-(sravStr(H1,H) ->CurCount1 is (CurCount + 1),ccc(T,H1,Count,CurCount1);ccc(T,H1,Count,CurCount)).

countMaxStr(S,[H1|[]],Count,CurCount,Word,CurWord):-ccc(S,H1,Cou,0),(Cou > CurCount ->Count is Cou,append([],H1,Word),!;Count is CurCount,append([],CurWord,Word),!).
countMaxStr(S,[H1|T1],Count,CurCount,Word,CurWord):-ccc(S,H1,Cou,0),(Cou > CurCount ->CurCount1 is Cou,append([],H1,CurWord1),countMaxStr(S,T1,Count,CurCount1,Word,CurWord1);countMaxStr(S,T1,Count,CurCount,Word,CurWord)).


countMaxStr(S1,S2,WORD):-countMaxStr(S1,S2,Count,0,WORD,CurWord).

pr1_4:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen,unique_elems(LOW, List, CurList), countMaxStr(S,LOW,WORD),writeStr(WORD).


%5 Дан файл, вывести в отдельный файл строки, состоящие из слов, не
%повторяющихся в исходном файле.

countNoRep([H|[]],S,CurCount,Count):-(sravStr(H,S) -> CurCount1 is (CurCount + 1),Count is CurCount1,!;Count is CurCount,!).
countNoRep([H|T],S,CurCount,Count):-(sravStr(H,S) -> CurCount1 is (CurCount + 1),countNoRep(T,S,CurCount1,Count);countNoRep(T,S,CurCount,Count)).

norepeatStr(S,[H|[]],STR,WORDS):-countNoRep(S,H,0,Count),(Count > 1 -> append(STR,[],WORDS),!;append(STR,[[32],H],WORDS),!).
norepeatStr(S,[H|T],STR,WORDS):-countNoRep(S,H,0,Count),(Count > 1 -> norepeatStr(S,T,STR,WORDS);append(STR,[[32],H],STR1),norepeatStr(S,T,STR1,WORDS)).
norepeatStr(S,[H|T],WORDS):-norepeatStr(S,[H|T],[],WORDS).



pr1_5:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen,unique_elems(LOW, List, CurList), norepeatStr(LOW,List,WORDS),tell0,writewrite(WORDS),told.

%8
%Дана строка в которой записаны слова через пробел. Необходимо
%посчитать количество слов с четным количеством символов.


chetWord([],CurCount,Count):-Count is CurCount,!.
chetWord([H|T],CurCount,Count):-CurCount1 is (CurCount + 1),chetWord(T,CurCount1,Count).


chetWordsStr([],CurCount,Count):-Count is CurCount,!.
chetWordsStr([H|T],CurCount,Count):-chetWord(H,0,Counts),((Counts mod 2 =:= 0) ->CurCount1 is (CurCount + 1),chetWordsStr(T,CurCount1,Count);chetWordsStr(T,CurCount,Count)).
chetWordsStr(LOW,COUNT):-chetWordsStr(LOW,0,COUNT).


pr2_8:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen, chetWordsStr(LOW,COUNT),write(COUNT).

%16
%Дан массив в котором находятся строки "белый", "синий" и
%"красный" в случайном порядке. Необходимо упорядочить массив так,
%чтобы получился российский флаг.
%119 98 114



flagStrW([],_,_,_):-!.
flagStrW([H|T],WHITE):-H = [H1|T1],(H1 =:= 119 -> takeWord(H,WHITE),!;flagStrW(T,WHITE)).

flagStrB([],_,_,_):-!.
flagStrB([H|T],BLUE):-H = [H1|T1],(H1 =:= 98 -> takeWord(H,BLUE),!;flagStrB(T,BLUE)).

flagStrR([],_,_,_):-!.
flagStrR([H|T],RED):-H = [H1|T1],(H1 =:= 114 -> takeWord(H,RED),!;flagStrR(T,RED)).


pr2_16:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen,flagStrW(LOW,W),writeStr(W),nl,flagStrB(LOW,B),writeStr(B),nl,flagStrR(LOW,R),writeStr(R).



%3 Дана строка в которой слова записаны через пробел. Необходимо
%перемешать все слова этой строки в случайном порядке.

mix([], [], []):-!.
mix([], _B, []):-!.
mix(_A, [], []):-!.
mix([AHead|ATail], [BHead|BTail], [AHead,BHead|Tail]):-mix(ATail, BTail, Tail).

halfStr([],Count,_,_):-!.
halfStr([H|T],Count,[],[H2|T2]):-Count =< 0, CurCount is (Count - 1),takeWord(H,H2),halfStr(T,CurCount,[],T2).
halfStr([H|T],Count,[H1|T1],[H2|T2]):-Count =< 0, CurCount is (Count - 1),takeWord(H,H2),halfStr(T,CurCount,[],T2).
halfStr([H|T],Count,[H1|T1],[H2|T2]):-Count > 0, CurCount is (Count - 1),takeWord(H,H1),halfStr(T,CurCount,T1,[H2|T2]).

takeWord([H1|[]],[H2|_]):-H2 is H1,!.
takeWord([H1|T1],[H2|T2]):-H2 is H1,takeWord(T1,T2).


pr2_3:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen, countN(LOW,COUNT),Count1 is (COUNT div 2), halfStr(LOW,Count1,S1,S2),mix(S2,S1,MIXED),writewrite(MIXED).




% Задание 3

list_to_year([X1, X2, X3, X4], Year) :-
  X11 is X1 - 48,
  X21 is X2 - 48,
  X31 is X3 - 48,
  X41 is X4 - 48,
  Year is (X11 * 1000 + X21 * 100 + X31 * 10 + X41).


month(1, L) :- L = [1103, 1085, 1074, 1072, 1088, 1103], !.
month(2, L) :- L = [1092, 1077, 1074, 1088, 1072, 1083, 1103], !.
month(3, L) :- L = [1084, 1072, 1088, 1090, 1072], !.
month(4, L) :- L = [1072, 1087, 1088, 1077, 1083, 1103], !.
month(5, L) :- L = [1084, 1072, 1103], !.
month(6, L) :- L = [1080, 1102, 1085, 1103], !.
month(7, L) :- L = [1080, 1102, 1083, 1103], !.
month(8, L) :- L = [1072, 1074, 1075, 1091, 1089, 1090, 1072], !.
month(9, L) :- L = [1089, 1077, 1085, 1090, 1103, 1073, 1088, 1103], !.
month(10, L) :- L = [1086, 1082, 1090, 1103, 1073, 1088, 1103], !.
month(11, L) :- L = [1085, 1086, 1103, 1073, 1088, 1103], !.
month(12, L) :- L = [1076, 1077, 1082, 1072, 1073, 1088, 1103], !.


day([X1, X2], _, _) :- (X1 = 48, X2 >= 49, X2 =< 57), !.
day([X1, X2], _, _) :- (X1 = 49, X2 >= 48, X2 =< 57), !.
day([X1, X2], _, _) :- (X1 = 50, X2 >= 48, X2 =< 56), !.
day([X1, X2], M, Y) :- (X1 = 50, X2 = 57, M = 2, 0 is Y mod 4), !.
day([X1, X2], M, _) :- (X1 = 50, X2 = 57, M \= 2), !.
day([X1, X2], M, _) :- (X1 = 51, X2 = 48, M \= 2), !.
day([X1, X2], M, _) :- (X1 = 51, X2 = 49, (M = 1 | M = 3 | M = 5 | M = 7 | M = 8 | M = 10 | M = 12)), !.


year([X1, X2, X3, X4]) :- (X1 >= 48, X1 =< 57, X2 >= 48, X2 =< 57, X3 >= 48, X3 =< 57, X4 >= 48, X4 =< 57).

% ñîñòîèò ëè ñïèñîê òîëüêî èç ïðîáåëîâ
only_spaces([]) :- !.
only_spaces([H|T]) :-
  (H = 32 ->
  only_spaces(T);
  fail).


find_date_in_str([], Dates, Dates) :- !.
find_date_in_str(List, Dates, Dates) :- only_spaces(List), !.
find_date_in_str(List, Dates, Dates) :-
  list_of_words(List, Words),
  count_els(Words, Count),
  Count < 3, !.
find_date_in_str([D1|DT], CurDates, Dates) :-
  (([_|[D2|[32|ListNoDay]]] = [D1|DT],
  [D1, D2] = WordDay,
  firstword(ListNoDay, WordMonth),
  month(Month, WordMonth),
  append(WordMonth, ListNoMonth1, ListNoDay),
  append([32], ListNoMonth, ListNoMonth1),
  [Y1|[Y2|[Y3|[Y4|_]]]] = ListNoMonth,
  [Y1, Y2, Y3, Y4] = WordYear,
  year(WordYear),
  list_to_year(WordYear, Year),
  day(WordDay, Month, Year)
  ) ->
  (append(WordDay, [32], DS),
  append(DS, WordMonth, DSM),
  append(DSM, [32], DSMS),
  append(DSMS, WordYear, DSMSY),
  append(CurDates, [DSMSY], CurDates1),
  append([Y1, Y2], NewT, ListNoMonth),
  find_date_in_str(NewT, CurDates1, Dates));
  (find_date_in_str(DT, CurDates, Dates))).
find_date_in_str(Str, Dates) :- find_date_in_str(Str, [], Dates).

pr3 :-
  write("Str -> "),
  read_str_nofix(S),
  find_date_in_str(S, Dates),
  write("Dates =>"), nl,
  write_list_str(Dates).
%1.3
%Дана строка. Необходимо найти общее количество русских
%символов.
countR([], Count, Count) :- !.
countR([H|T], CurCount, Count) :-
  (((H > 1039),(H < 1104))-> CurCount1 is CurCount + 1,
  countR(T, CurCount1, Count);CurCount1 is CurCount,countR(T, CurCount1, Count)).
countR(List, Count) :- countR(List, 0, Count).



pr4_3:-
    see0,readStr(S),nl,seen,
    countR(S,COUNT),write(COUNT).


%1.8
%Дана строка. Необходимо найти все используемые в ней строчные
%символы латиницы.



countNR([], Count, Count) :- !.
countNR([H|T], CurCount, Count) :-
  (((H > 1071),(H < 1104))-> CurCount1 is CurCount + 1,
  countNR(T, CurCount1, Count);CurCount1 is CurCount,countNR(T, CurCount1, Count)).
countNR(List, Count) :- countNR(List, 0, Count).



pr4_8:-
    see0,readStr(S),nl,seen,
    countNR(S,COUNT),write(COUNT).


%1.16 Дана строка. Необходимо найти минимальное из имеющихся в ней
%целых чисел.
getNumber([],Num,Num):-!.
getNumber([H|T],CurNum,Num):-CurNum1 is (H - 48 + CurNum),(T = [] -> getNumber(T,CurNum1,Num);CurNum2 is (CurNum1 * 10),getNumber(T,CurNum2,Num)).

getNumbers([],S,NUMBERS):-takeWord(S,NUMBERS).
getNumbers([H|T],S,NUMBERS):-getNumber(H,0,Num),append(S,[Num],CurS),getNumbers(T,CurS,NUMBERS).

getNumbers(LOW,NUMBERS):-getNumbers(LOW,[],NUMBERS).

writeStrNew([H|[]]) :- !.
writeStrNew([H|Tail]) :-
  write(H),
  writeStrNew(Tail).

getMin([],MIN,MIN):-!.
getMin([H|T],CurMin,MIN):-(CurMin > H -> CurMin1 is H,getMin(T,CurMin1,MIN);getMin(T,CurMin,MIN)).
getMin([H|T],MIN):-CurMin is H,getMin(T,CurMin,MIN).

pr4_16:-
    see0,readStr(S),nl,seen,
    get_words(S,LOW,K),getNumbers(LOW,NUMBERS),getMin(NUMBERS,MIN),write(MIN).






% задание 5
list_of_lengths([], List, List) :- !.
list_of_lengths([H|T], CurList, List) :-
  count_els(H, Count),
  append(CurList, [Count], CurList1),
  list_of_lengths(T, CurList1, List).
list_of_lengths(ListStrs, ListLengths) :- list_of_lengths(ListStrs, [], ListLengths).

min_ls_down([], Min, Min) :- !.
min_ls_down([H|T], CurMin, Min) :-
  (H < CurMin ->
  CurMin1 is H;
  CurMin1 is CurMin),
  min_ls_down(T, CurMin1, Min).
min_ls_down([H|T], Min) :- min_ls_down(T, H, Min).



sort_strs_by_length([], [], List, List) :- !.
sort_strs_by_length(ListStrs, ListLengths, CurList, List) :-
  min_ls_down(ListLengths, Min),
  ls_num_el(ListLengths, Min, Num),
  ls_el_at_num(ListStrs, Num, El),
  append(CurList, [El], CurList1),
  rm_el(ListStrs, Num, ListStrs1),
  rm_el(ListLengths, Num, ListLengths1),
  sort_strs_by_length(ListStrs1, ListLengths1, CurList1, List).
sort_strs_by_length(ListStrs, NewListStrs) :-
  list_of_lengths(ListStrs, ListLengths),
  sort_strs_by_length(ListStrs, ListLengths, [], NewListStrs).


pr5 :-
  see0,
  read_list_str(ListStr),
  sort_strs_by_length(ListStr, NewListStr),
  seen,
  tell0,
  write_list_str(NewListStr),
  told.


%задание 6
count_words([], Count, Count) :- !.
count_words(List, CurCount, Count) :-
  list_nofirstspaces(List, ListNoFirstSpaces),
  (ListNoFirstSpaces \= [] ->
  (firstword(ListNoFirstSpaces, FirstWord),
  append(FirstWord, ListNoFirstWord, ListNoFirstSpaces),
  CurCount1 is CurCount + 1);
  (ListNoFirstWord = [],
  CurCount1 is CurCount)),
  count_words(ListNoFirstWord, CurCount1, Count).
count_words(List, Count) :- count_words(List, 0, Count).


list_of_count_words([], List, List) :- !.
list_of_count_words([H|T], CurList, List) :-
  count_words(H, Count),
  append(CurList, [Count], CurList1),
  list_of_count_words(T, CurList1, List).
list_of_count_words(ListStrs, ListCounts) :- list_of_count_words(ListStrs, [], ListCounts).


sort_strs_by_count(ListStrs, NewListStrs) :-
  list_of_count_words(ListStrs, ListCounts),
  sort_strs_by_length(ListStrs, ListCounts, [], NewListStrs).

pr6 :-
  see0,
  read_list_str(ListStr),
  sort_strs_by_count(ListStr, NewListStr),
  seen,
  tell0,
  write_list_str(NewListStr),
  told.


%задание 7
check_for_num([]) :- !.
check_for_num([H|T]) :-
  (H >= 48, H =< 57),
  check_for_num(T).

count_words_after_num([_], Count, Count) :- !.
count_words_after_num([], Count, Count) :- !.
count_words_after_num([H|T], CurCount, Count) :-
  ((check_for_num(H)) ->
  CurCount1 is CurCount + 1;
  CurCount1 is CurCount),
  count_words_after_num(T, CurCount1, Count).
count_words_after_num(List, Count) :-
  list_of_words(List, Words),
  count_words_after_num(Words, 0, Count).

list_of_count_words_after_num([], List, List) :- !.
list_of_count_words_after_num([H|T], CurList, List) :-
  count_words_after_num(H, Count),
  append(CurList, [Count], CurList1),
  list_of_count_words_after_num(T, CurList1, List).
list_of_count_words_after_num(ListStrs, ListCounts) :- list_of_count_words_after_num(ListStrs, [], ListCounts).


sort_strs_by_count_words_after_num(ListStrs, NewListStrs) :-
  list_of_count_words_after_num(ListStrs, ListCounts),
  sort_strs_by_length(ListStrs, ListCounts, [], NewListStrs).

pr7 :-
  see0,
  read_list_str(ListStr),
  list_of_count_words_after_num(ListStr, Counts),
  write(Counts),
  sort_strs_by_count_words_after_num(ListStr, NewListStr),
  seen,
  tell0,
  write_list_str(NewListStr),
  told.

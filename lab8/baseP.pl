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



flagStr([],_,_,_):-!.
flagStr([H|T],WHITE,BLUE,RED):-H = [H1|T1],(H1 =:= 1073 -> takeWord(H,WHITE),flagStr(T,WHITE,BLUE,RED);(H1 =:= 1089 -> takeWord(H,BLUE),flagStr(T,WHITE,BLUE,RED);takeWord(H,RED),flagStr(T,WHITE,BLUE,RED))).


pr2_16:-
    see0,readStrF(S),nl,
    getWordsStr(S,LOW),seen,flagStr(LOW,W,B,R),writeStr(W),nl,writeStr(B),nl,writeStr(R).



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




%Задание 3 Дана строка. Необходимо найти все даты, которые описаны в
%виде "31 февраля 2007"
checkDay([],CurS,S):-!.
checkDay1([H|T],CurS,S):-!.
checkSpace([H|T],CurS,S):-!.
checkMonth([H|T],CurS,S):-!.
checkYear3([H|T],CurS,S):-!.
checkYear2([H|T],CurS,S):-!.
checkYear1([H|T],CurS,S):-!.
checkYear([H|T],CurS,S):-!.


checkYear3([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),takeWord(CurS1,S),!;!).
checkYear2([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),checkYear3(T,CurS1,S);!).
checkYear1([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),checkYear2(T,CurS1,S);!).
checkYear([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),checkYear1(T,CurS1,S);!).


checkMonth([H|T],CurS,S):-(((H > 1071),(H < 1104)) -> append(CurS,H,CurS1),checkMonth(T,CurS1,S);(H =:= 32 -> append(CurS,H,CurS1),checkYear(T,CurS1,S);!)).

checkSpace([H|T],CurS,S):-(H =:= 32 -> append(CurS,[32],CurS1),checkMonth(T,CurS1,S);!).

checkDay1([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),checkSpace(T,CurS1,S);!).
checkDay([H|T],CurS,S):-(((H > 47),(H < 58)) -> append(CurS,H,CurS1),checkDay1(T,CurS1,S);!).

dateStr([H|T],CurS,S1):-checkDay([H|T],[],Date).
dateStr(S,S1):-dateStr(S,[],S1),!.

pr3:-
    see0,readStrF(S),nl,seen,
    dateStr(S,DATE),
    writeStr(DATE).

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

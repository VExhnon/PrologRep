read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).


write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).



sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([Head|Tail], CurSum, Sum) :- CurSum1 is CurSum + Head, sum_ls_down(Tail, CurSum1, Sum).


sum_ls_up([],0) :- !.
sum_ls_up([Head|Tail], Sum) :- sum_ls_up(Tail,Sum1),Sum is (Sum1 + Head).


%Задание 4 Построить предикат, list_el_numb(+List, ?Elem, ?Number). Если
%задано значение Elem, то предикат записывает в Number номер первого
%вхождения Elem. Если задано значение Number, то предикат записывает в
%Elem значение, находящееся в списке под номером Number. Если заданы
%оба значения, то предикат проверяет, находится ли элемент Elem в списке
%под номером Numb.


list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).

%Задание 4 Реализовать программу, которая читает список, читает элемент
%и находит номер первого вхождения элемента в список. В случае, если
%элемент
%отсутствует,
%пользователю
%выводится
%соответствующее
%сообщение. Воспользоваться предикатами из заданий 1 и 3


pr4_2:-write("Введите N: "),
       read(N),nl,write("Введите List"),
       read_list(N,List),nl,
       write("Введите элемент: "),
       read(L),nl,
       list_el_numb(List,L,Numb),
       write(Numb),!;
       write("Нет элемента").

%Задание 5 Реализовать программу, которая читает список, читает номер
%элемента и находит соответствующий элемент. В случае, если номер
%некорректный, пользователю выводится соответствующее сообщение.


pr5:-  write("Введите N: "),
       read(N),nl,
       write("Введите List"),
       read_list(N,List),nl,
       write("Введите номер элемента: "),
       read(Numb),nl,
       list_el_numb(List,L,Numb),
       write(L),!.

pr5:- write("Нет элемента под таким номером(").


%Задание 6 Реализовать предикат min_list_up(+List, ?Min), который
%записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным
%элементом в списке List. Реализацию провести рекурсией вверх.


min_list_up([H], H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).


%Задание 7 Реализовать предикат min_list_down(+List, ?Min), который
%записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным
%элементом в списке List. Реализацию провести рекурсией вниз.


min_list_down([],Min,Min):-!.
min_list_down([H|T],X,Min):-(H < X -> X1 is H; X1 is X),min_list_down(T,X1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).


%Задание 8 Реализовать программу, которая читает список, находит и
%выводит
%на
%экран
%его
%минимальный
%предикатами из заданий 1, 6 или 7

pr8:-write("Количество элементов списка: "),
       read(N),nl,
       write("Введите список"),
       read_list(N,List),
       min_list_down(List,Min),
       write("Минимальный элемент списка: "),
       write(Min),!.

pr8:-write("Список пустой!").


%Задание 9 Построить предикат, который возвращает true, если элемент
%есть в списке.

member(X,[X|_]):-!.
member(X,[_|T]):-member(X,T).


%Задание 10 Построить предикат, который переворачивает список.


reverse(L):-reverse(L,[],Answ).
reverse([],InvL,InvL):-!.
reverse([H|T],CurList,InvL):-reverse(T,[H|CurList],InvL).


%Задание 11 Построить предикат p(Sublist,List), который возвращает true,
%если элементы Sublist встречается в List в том же порядке.

sub_list([],_):-!.
sub_list([H|TS],[H|TL]):-sub_list(TS,TL).

p(S,L):-sub_list(S,L),!.
p(S,[_|T]):-p(S,T).


%Задание 12 Построить предикат, который удаляет элемент с заданным
%номером из списка.

del_num(0,[_|T],T):- !.
del_num(X,[Head|T1],[Head|T2]) :- X1 is X-1,del_num(X1,T1,T2).

%Задание 13 Построить предикат, который удаляет все элементы, равные
%данному.

rem_num([],_,[]).
rem_num([H|T],H,T1):-!,rem_num(T,H,T1).
rem_num([H|T],X,[H|T1]):-rem_num(T,X,T1).


%Задание 14 Построить предикат, который проверяет, встречаются ли все
%элементы в списке ровно 1 раз.

aloneCheck([]):-!.
aloneCheck(_,[]):-!.
aloneCheck(X,[H|T]):- not(X =:= H),aloneCheck(X,T).
aloneCheck([H|T]):-aloneCheck(H,T),aloneCheck(T).


%Задание 15 Построить предикат, который строит новый список,
%составленный из уникальных элементов введенного, то есть убирает все
%повторы, например из списка [1,1,2,3,3,3] получает список [1,2,3].

simplification([],[]):-!.
simplification([H|T],T1):-member(H,T),simplification(T,T1),!.
simplification([H|T],[H|T1]):-not(member(H,T)),simplification(T,T1),!.



%Задание 16 Построить предикат, который получает для данного элемента
%количество раз, которое он встречается в списке.

kolNum([],_,N,N):-!.
kolNum([H|T],X,N,Y):- (H =:= X -> N1 is (N + 1),kolNum(T,X,N1,Y);N1 is N,kolNum(T,X,N1,Y)).
kolNum(L,X,Y):-kolNum(L,X,0,Y).


%Задание 17 Построить предикат, получающий длину списка.

lenght([],0).
lenght([_|T],X):-lenght(T,X1),X is (X1 + 1).


%1.3
%Дан целочисленный массив и натуральный индекс (число, меньшее
%размера массива). Необходимо определить является ли элемент по
%указанному индексу глобальным максимумом.
max_list_up([H], H):-!.
max_list_up([H|T], Max):-max_list_up(T,Max1),(H > Max1 -> Max is H;Max is Max1).

maxOrNot(L,X):-max_list_up(L,Max),list_el_numb(L,Max,X).
maxOrNotT(L,X):-maxOrNot(L,X).

read_list(N,L):- read_list(N,0,[],L).
read_list(N,N,L,L):-!.
read_list(N,CurN,CurList,L):-CurN1 is CurN+1,read(X),append(CurList,[X],CurList1), read_list(N,CurN1, CurList1,L).
read_list(N,CurN1,CurList1,L).



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
list_el_numb([_|T],L,X,N):-X1 is (X+1),list_el_numb(T,L,X1,N).
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
       list_el_numb(List,L,N),
       write(N),!;
       write("Нет элемента").


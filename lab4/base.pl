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


%«адание 4 ѕостроить предикат, list_el_numb(+List, ?Elem, ?Number). ≈сли
%задано значение Elem, то предикат записывает в Number номер первого
%вхождени€ Elem. ≈сли задано значение Number, то предикат записывает в
%Elem значение, наход€щеес€ в списке под номером Number. ≈сли заданы
%оба значени€, то предикат провер€ет, находитс€ ли элемент Elem в списке
%под номером Numb.

list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is (X+1),list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).


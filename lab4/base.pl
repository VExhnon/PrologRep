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

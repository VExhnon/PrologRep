read_list(N,L):- read_list(N,0,[],L).
read_list(N,N,L,L):-!.
read_list(N,CurN,CurList,L):-CurN1 is CurN+1,read(X),append(CurList,[X],CurList1), read_list(N,CurN1, CurList1,L).
read_list(N,CurN1,CurList1,L).



write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).


list_sum([], 0).
%list_sum([Head|_],S):-S is Head.
list_sum([Head|Tail],S):-list_sum(Tail,S1),S is (S1+Head).



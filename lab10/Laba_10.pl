read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

in_list([El|_],El):-!.
in_list([_|L],El):-in_list(L,El),!.

%1
number_1:-write("первый граф"),nl,get_V(V1),nl,get_edges(V1,E1),write("второй граф"),nl,get_V(V2),nl,get_edges(V2,E2),write("первый граф: "),write(V1),write(E1),nl,write("второй граф: "),write(V2),write(E2),nl,nl,write("объединение:"),nl,union(V1,V2,E1,E2),nl,write("пересечение:"),nl,intersection(V1,V2,E1,E2),nl,write("сумма по модулю 2:"),nl,sum(V1,V2,E1,E2).

get_V(V):-nl,write("количество вершин = "),read(N),nl,write("вершины: "),nl,N1 is N+1,get_V([_|V],N1).
get_V([],0):-!.
get_V([H|T],N):-read_str(X,_),name(H,X),N1 is N-1,get_V(T,N1).

get_edges(V,E):-nl,write("количество ребер = "),read(M),nl,write("ребра: "),nl,get0(X),get_edges(V,E,[],M,0).
get_edges(_,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),Count1 is Count+1,get_edges(V,E,E1,M,Count1).

get_edge(V,[V1,V2]):-write("Edge:"),nl,read_str(X,_),name(V1,X),check_vertex(V,V1),read_str(Y,_),name(V2,Y),check_vertex(V,V2).

check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).

union(V1,V2,E1,E2):-u_vertexes(V1,V2,V3),u_edges(E1,E2,E3),write("вершины:"),write(V3),nl,write("ребра:"),nl,write(E3),nl.

u_vertexes(V,[],V):-!.
u_vertexes(V1,[H|V2],V3):-not(in_list(V1,H))->append(V1,[H],V),u_vertexes(V,V2,V3),!.
u_vertexes(V1,[_|V2],V3):-u_vertexes(V1,V2,V3),!.

u_edges(E,[],E):-!.
u_edges(E1,[H|E2],E3):-not(in_list(E1,H))->append(E1,[H],E),u_edges(E,E2,E3),!.
u_edges(E1,[_|E2],E3):-u_edges(E1,E2,E3),!.

intersection(V1,V2,E1,E2):-i_vertexes(V1,V2,V3),i_edges(E1,E2,E3),write("вершины:"),write(V3),nl,write("ребра:"),nl,write(E3),nl.

i_vertexes(_,[],[]):-!.
i_vertexes(V1,[H|V2],[H|V3]):-in_list(V1,H)->i_vertexes(V1,V2,V3),!.
i_vertexes(V1,[_|V2],V3):-i_vertexes(V1,V2,V3),!.

i_edges(_,[],[]):-!.
i_edges(E1,[H|E2],[H|E3]):-in_list(E1,H)->i_edges(E1,E2,E3),!.
i_edges(E1,[_|E2],E3):-i_edges(E1,E2,E3),!.

sum(V1,V2,E1,E2):-s_vertexes(V1,V2,V3),s_edges(E1,E2,E3),write("вершины:"),write(V3),nl,write("ребра:"),nl,write(E3).

s_vertexes(V1,V2,V3):-s_vertexes1(V1,V2,V31),s_vertexes1(V2,V1,V32),append(V31,V32,V3).
s_vertexes1(_,[],[]):-!.
s_vertexes1(V1,[H|V2],[H|V3]):-not(in_list(V1,H))->s_vertexes1(V1,V2,V3),!.
s_vertexes1(V1,[_|V2],V3):-s_vertexes1(V1,V2,V3),!.

s_edges(E1,E2,E3):-s_edges1(E1,E2,E31),s_edges1(E2,E1,E32),append(E31,E32,E3).
s_edges1(_,[],[]):-!.
s_edges1(E1,[H|E2],[H|E3]):-not(in_list(E1,H))->s_edges1(E1,E2,E3),!.
s_edges1(E1,[_|E2],E3):-s_edges1(E1,E2,E3),!.


%2 
number_2:-write("код прюфера: "),read_str(Code,Len),N is Len+2,build_edge_list(Code,N,E),build_matr(E,N,M),write_matr(M).

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

in_list_exlude([El|T],El,T):-!.
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail),!.

build_edge_list(C,N,E):-make_ar(N,V),to_int(C,C1),build_edges(C1,[],E,V).

to_int([],[]):-!.
to_int([H|V],[H1|V1]):-H1 is H-48,to_int(V,V1),!.

build_edges([],E1,E,V):-append(E1,[V1],E2),reverse(V,V1),append(E2,[V1],E),!.
build_edges([N|C],E1,E,V):-min(V,[N|C],Min),in_list_exlude(V,Min,V1),append(E1,[[N,Min]],E2),append(E2,[[Min,N]],E3),build_edges(C,E3,E,V1),!.

min([H|L],C,M):-(not(in_list(C,H))->min(L,C,H,M);min(L,C,M)),!.
min([],_,M,M):-!.
min([H|L],C,M1,M):-(not(in_list(C,H)),M1>H->min(L,C,H,M);min(L,C,M1,M)),!.

build_matr(E,N,M1):-i([],1,E,M1,N).

i(M,N,_,M,LenN):-N>LenN,!.
i(M,N,E,M1,LenN):-in_str(E,N,S,E1),j(L,S,LenN),N1 is N+1,append(M,[L],M2),i(M2,N1,E1,M1,LenN),!.

in_str(E,N,S,E1):-in_str(E,N,S,E,E1),!.
in_str([],_,[],E1,E1):-!.
in_str([[N,H2]|E],N,[H2|S],E2,E1):-in_list_exlude(E2,[N,H2],E3),in_str(E,N,S,E3,E1),!.
in_str([_|E],N,S,E2,E1):-in_str(E,N,S,E2,E1),!.

j(L,S,LenN):-j(L,1,S,LenN).
j([],N1,_,N):-N1>N,!.
j([1|L],N,S,Len):-in_list(S,N),N1 is N+1,j(L,N1,S,Len),!.
j([0|L],N,S,Len):-N1 is N+1,j(L,N1,S,Len),!.

write_matr([]):-!.
write_matr([H|T]):-write(H),nl,write_matr(T),!.

%3
number_3:-get_V(V),nl,get_edges(V,E),euler_N(E).

in_list_exlude1([El|T],El,T).
in_list_exlude1([H|T],El,[H|Tail]):-in_list_exlude1(T,El,Tail).

b_a_r([],[]):-!.
b_a_r(A,[El|Perm]):-in_list_exlude1(A,El,A1),b_a_r(A1,Perm).

euler_N(E):-b_a_r(E,Way),length(E,L),path(L,Way),write(Way).
path(L,T):-path1(L1,T),L1==L.
path1(1,[_]):-!.
path1(K,[[_,X]|[[X,Y]|T]]):-path1(K1,[[X,Y]|T]),K is K1+1.
path1(K,[[_,X]|[[Y,X]|T]]):-path1(K1,[[X,Y]|T]),K is K1+1.

%4
number_4:-get_V(V),nl,get_edges(V,E),chislo_vn_ust(V,E).

chislo_vn_ust(V,E):-length(V,L),pokr(L,V,E,L,M),write("число внешней устойчивости = "),write(M).

pokr(_,[],_,M,M):-!.
pokr(L,[H],E,M1,M):-p([H],E,0,L1),L2 is L-1,(L1==L2->pokr(L,[],E,1,M);pokr(L,[],E,M1,M)),!.
pokr(L,[H|P],E,M1,M):-pokr(P,[H],E,L,1,M2),(nonvar(M2)->(M2<M1->pokr(L,P,E,M2,M);pokr(L,P,E,M1,M));pokr(L,P,E,M1,M)),!.

pokr([H|P],V,E,L,M1,M):-p(V,E,0,L1),length(V,Lv),L2 is L-Lv,L1\=L2->M2 is M1+1,pokr(P,[H|V],E,L,M2,M),!.
pokr(_,V,E,L,M1,M1):-p(V,E,0,L1),length(V,Lv),L2 is L-Lv,L1==L2,!.
pokr([],_,_,_,_,_):-!.

p(_,[],K,K):-!.
p(V,[[X,Y]|T],L,K):-in_list(V,X),not(in_list(V,Y)),L1 is L+1,p(V,T,L1,K).
p(V,[[X,Y]|T],L,K):-in_list(V,Y),not(in_list(V,X)),L1 is L+1,p(V,T,L1,K).
p(V,[_|T],L,K):-p(V,T,L,K),!.

%5
number_5:-get_V(V),nl,get_edges(V,E),not(par(E,[])).

par([H|E1],S):-par([H],E1,T),check_par(T,S),write(T),nl,par(E1,[H|S]).
par(T,[],T).
par(T,[[A,B]|E],T1):-check_edge(T,[A,B])->par([[A,B]|T],E,T1);par(T,E,T1).

check_par(_,[]):-!.
check_par(T,[[A,B]|N]):-check_edge(T,[A,B])->!,fail;check_par(T,N),!.

check_edge([],_):-!.
check_edge([[X,Y]|_],[X,Y]):-!,fail.
check_edge([[X,Y]|_],[Y,X]):-!,fail.
check_edge([[_,Y]|_],[Y,_]):-!,fail.
check_edge([[_,Y]|_],[_,Y]):-!,fail.
check_edge([[X,_]|_],[_,X]):-!,fail.
check_edge([[X,_]|_],[X,_]):-!,fail.
check_edge([_|T],[A,B]):-check_edge(T,[A,B]),!.

read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail).


write_list([]):-!.
write_list([H/T]):-write(H),write_list(T).



sum_ls_down([], Sum, Sum) :- !.
sum_ls_down([Head|Tail], CurSum, Sum) :- CurSum1 is CurSum + Head, sum_ls_down(Tail, CurSum1, Sum).


sum_ls_up([],0) :- !.
sum_ls_up([Head|Tail], Sum) :- sum_ls_up(Tail,Sum1),Sum is (Sum1 + Head).


%������� 4 ��������� ��������, list_el_numb(+List, ?Elem, ?Number). ����
%������ �������� Elem, �� �������� ���������� � Number ����� �������
%��������� Elem. ���� ������ �������� Number, �� �������� ���������� �
%Elem ��������, ����������� � ������ ��� ������� Number. ���� ������
%��� ��������, �� �������� ���������, ��������� �� ������� Elem � ������
%��� ������� Numb.


list_el_numb([H|_],H,N,N):-!.
list_el_numb([_|T],L,X,N):-X1 is X+1,list_el_numb(T,L,X1,N).
list_el_numb(List,L,N):-list_el_numb(List,L,0,N).

%������� 4 ����������� ���������, ������� ������ ������, ������ �������
%� ������� ����� ������� ��������� �������� � ������. � ������, ����
%�������
%�����������,
%������������
%���������
%���������������
%���������. ��������������� ����������� �� ������� 1 � 3


pr4_2:-write("������� N: "),
       read(N),nl,write("������� List"),
       read_list(N,List),nl,
       write("������� �������: "),
       read(L),nl,
       list_el_numb(List,L,Numb),
       write(Numb),!;
       write("��� ��������").

%������� 5 ����������� ���������, ������� ������ ������, ������ �����
%�������� � ������� ��������������� �������. � ������, ���� �����
%������������, ������������ ��������� ��������������� ���������.


pr5:-  write("������� N: "),
       read(N),nl,
       write("������� List"),
       read_list(N,List),nl,
       write("������� ����� ��������: "),
       read(Numb),nl,
       list_el_numb(List,L,Numb),
       write(L),!.

pr5:- write("��� �������� ��� ����� �������(").


%������� 6 ����������� �������� min_list_up(+List, ?Min), �������
%���������� ����������� ������� ������ List � ���������� Min ���
%���������, �������� �� �������� � ���������� Min �����������
%��������� � ������ List. ���������� �������� ��������� �����.


min_list_up([H], H):-!.
min_list_up([H|T], Min):-min_list_up(T,Min1),(H < Min1 -> Min is H;Min is Min1).


%������� 7 ����������� �������� min_list_down(+List, ?Min), �������
%���������� ����������� ������� ������ List � ���������� Min ���
%���������, �������� �� �������� � ���������� Min �����������
%��������� � ������ List. ���������� �������� ��������� ����.


min_list_down([],Min,Min):-!.
min_list_down([H|T],X,Min):-(H < X -> X1 is H; X1 is X),min_list_down(T,X1,Min).
min_list_down([H|T],Min):- min_list_down(T,H,Min).


%������� 8 ����������� ���������, ������� ������ ������, ������� �
%�������
%��
%�����
%���
%�����������
%����������� �� ������� 1, 6 ��� 7

pr8:-write("���������� ��������� ������: "),
       read(N),nl,
       write("������� ������"),
       read_list(N,List),
       min_list_down(List,Min),
       write("����������� ������� ������: "),
       write(Min),!.

pr8:-write("������ ������!").


%������� 9 ��������� ��������, ������� ���������� true, ���� �������
%���� � ������.

member(X,[X|_]):-!.
member(X,[_|T]):-member(X,T).


%������� 10 ��������� ��������, ������� �������������� ������.


reverse(L):-reverse(L,[],Answ).
reverse([],InvL,InvL):-!.
reverse([H|T],CurList,InvL):-reverse(T,[H|CurList],InvL).


%������� 11 ��������� �������� p(Sublist,List), ������� ���������� true,
%���� �������� Sublist ����������� � List � ��� �� �������.

sub_list([],_):-!.
sub_list([H|TS],[H|TL]):-sub_list(TS,TL).

p(S,L):-sub_list(S,L),!.
p(S,[_|T]):-p(S,T).


%������� 12 ��������� ��������, ������� ������� ������� � ��������
%������� �� ������.

del_num(0,[_|T],T):- !.
del_num(X,[Head|T1],[Head|T2]) :- X1 is X-1,del_num(X1,T1,T2).

%������� 13 ��������� ��������, ������� ������� ��� ��������, ������
%�������.

rem_num([],_,[]).
rem_num([H|T],H,T1):-!,rem_num(T,H,T1).
rem_num([H|T],X,[H|T1]):-rem_num(T,X,T1).


%������� 14 ��������� ��������, ������� ���������, ����������� �� ���
%�������� � ������ ����� 1 ���.

aloneCheck([]):-!.
aloneCheck(_,[]):-!.
aloneCheck(X,[H|T]):- not(X =:= H),aloneCheck(X,T).
aloneCheck([H|T]):-aloneCheck(H,T),aloneCheck(T).


%������� 15 ��������� ��������, ������� ������ ����� ������,
%������������ �� ���������� ��������� ����������, �� ���� ������� ���
%�������, �������� �� ������ [1,1,2,3,3,3] �������� ������ [1,2,3].

simplification([],[]):-!.
simplification([H|T],T1):-member(H,T),simplification(T,T1),!.
simplification([H|T],[H|T1]):-not(member(H,T)),simplification(T,T1),!.



%������� 16 ��������� ��������, ������� �������� ��� ������� ��������
%���������� ���, ������� �� ����������� � ������.

kolNum([],_,N,N):-!.
kolNum([H|T],X,N,Y):- (H =:= X -> N1 is (N + 1),kolNum(T,X,N1,Y);N1 is N,kolNum(T,X,N1,Y)).
kolNum(L,X,Y):-kolNum(L,X,0,Y).


%������� 17 ��������� ��������, ���������� ����� ������.

lenght([],0).
lenght([_|T],X):-lenght(T,X1),X is (X1 + 1).


%1.3
%��� ������������� ������ � ����������� ������ (�����, �������
%������� �������). ���������� ���������� �������� �� ������� ��
%���������� ������� ���������� ����������.
max_list_up([H], H):-!.
max_list_up([H|T], Max):-max_list_up(T,Max1),(H > Max1 -> Max is H;Max is Max1).

maxOrNot(L,X):-max_list_up(L,Max),list_el_numb(L,Max,X).
maxOrNotT(L,X):-maxOrNot(L,X).

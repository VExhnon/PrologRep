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

member(X,[X|T]):-!.
member(X,[_|T]):-member(X,T).

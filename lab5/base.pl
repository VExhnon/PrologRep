sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_hair:- Friends=[_,_,_],

( in_list(Friends,[belokurov,redhead])),

(

in_list(Friends,[chernov,blond]);
in_list(Friends,[chernov,redhead])),

( in_list(Friends,[rizhov,brunet]);
in_list(Friends,[rizhov,blond])),

write(Friends).


pr_dress:- Dress=[_,_,_],
in_list(Dress,[nata,_,green]),

( in_list(Dress,[ann,white,white]);
in_list(Dress,[ann,blue,blue]);
in_list(Dress,[ann,green,green])),

( in_list(Dress,[valya,green,blue]);
in_list(Dress,[valya,blue,green])),

( in_list(Dress,[nata,blue,green]);
in_list(Dress,[nata,white,green])),


write(Dress).


%������� 4 �� ������ �������� ��� �����: �������, ������ � �������. ��
% ������� �������, ������ � �������. � ������� ��� �� �������, �� ������.
%
%��
%����� ������� �� ������. �������, ������� �� ������ ��������, ������
%������. ������� ������� �������, ������ � ��������.



pr_fact:- Fact=[_,_,_],

                in_list(Fact, [slesar, _, 0, 0, _]),
		in_list(Fact, [tokar, _, 1, _, _]),
		in_list(Fact, [svarschik, _, _, _, _]),
		in_list(Fact, [_, borisov, _, 1, _]),
		in_list(Fact, [_, ivanov, _, _, _]),
		in_list(Fact, [_, semenov, 2, _, borisov]),

		write(Fact), !.

%������� 5 � �������, �������, ������� � ����� ��������� ������,
%�������, ���� � ����. ��������, ��� ���� � ������ �� � �������, ����� �
%��������� ��������� ����� �������� � ������� � ������, � ����� - ��
%������� � �� ����. ������ ��������� ����� ����� � ������ � �������. ���
%������������ ��� �������� �� �������.


pr_drinkk :- Drinks = [_, _, _, _],

		in_list(Drinks, [bottle, _]),
		in_list(Drinks, [glass, _]),
		in_list(Drinks, [jug, _]),
		in_list(Drinks, [pot, _]),

		in_list(Drinks, [_, milk]),
		in_list(Drinks, [_, lemonade]),
		in_list(Drinks, [_, kvass]),
		in_list(Drinks, [_, water]),

		not(in_list(Drinks, [bottle, water])),
		not(in_list(Drinks, [bottle, milk])),

		next_to([_, lemonade], [jug, _], Drinks),
		next_to([_, lemonade], [_, kvass], Drinks),

		not(in_list(Drinks, [pot, lemonade])),
		not(in_list(Drinks, [pot, water])),

		next_to([pot, _], [glass, _], Drinks),
		next_to([pot, _], [_, milk], Drinks),

		write(Drinks), !.


%������� 6 �������, ������, �������� � ������� � ������ �����������
%������� ��������. ���� �� ��� ������, ������ ��������, ������-�����, �
%���������-��������. � ��� �������� ���������: ������� � �������� ������
%� ���� ������������� � ��� �����, ����� ����� ����������� � �������
% ��������. ������ � �������� ������ ���������� ���������. ��������
% �������
%�������������� ������� � �������� � ���������� �������� � ��������.
%������� ������� �� ������ � ��������. ��� ��� ����������?

pr_tal :- Talants = [_, _, _, _],

                in_list(Talants, [voronov, _, _,_]),
		in_list(Talants, [pavlov, _, _,_]),
		in_list(Talants, [levitskiy, _, _, _]),
		in_list(Talants, [saharov,_,_,_]),

		in_list(Talants, [_, dancer,_,_ ]),
		in_list(Talants, [_, painter,_,_ ]),
		in_list(Talants, [_, singer,_,_]),
		in_list(Talants, [_, writer, _ ,_]),





                in_list(Talants, [voronov, _, cons,writer]),
		in_list(Talants, [pavlov, _, _,painter]),
		in_list(Talants, [levitskiy, _, cons, _]),
                in_list(Talants, [saharov,_,_,writer]),


		in_list(Talants, [_, singer,cons,_]),
		in_list(Talants, [_, writer, _,painter]),


                not(in_list(Talants, [levitskiy, singer,_,_])),

                not(in_list(Talants, [pavlov, writer,_,_])),





		write(Talants), !.

%7��� ����� ������ ������, ������, ������ ����� �
%������������� �����������. ������ ������ ��������������, ����� �� ��-
%�������, � ����� ��� ������ ���� ������. ����� ������������ ��������� �
% ������ �����, ��� ����������. ������������ ������ ������ �����
% ����������. ����� � ������ ����� ������ �����. ��� ��������
% ������������?
%����� ������� ���������� ������?

%NAME, NATIONALITY, POSITION, SPORT, BetterThan
pr_friends :- Friend = [_, _, _],

    in_list(Friend, [michael,_,_,_,_]),
    in_list(Friend, [simon,_,_,_,_]),
    in_list(Friend, [richard,_,_,_,_]),

    in_list(Friend, [_,american,_,_,_]),
    in_list(Friend, [_,israelite,_,_,_]),
    in_list(Friend, [_,australian,_,_,_]),

    in_list(Friend, [_,_,1,_,_]),
    in_list(Friend, [_,_,2,_,_]),
    in_list(Friend, [_,_,3,_,_]),

    in_list(Friend, [_,_,_,basketball,_]),
    in_list(Friend, [_,_,_,tennis,_]),
    in_list(Friend, [_,_,_,cricket,_]),


		in_list(Friend, [michael,_,_,basketball,american]),
                in_list(Friend, [simon,israelite,_,_,tennis]),
                in_list(Friend, [_,_,1,cricket,_]),

                in_list(Friend,[W1,australian,_,_,_]),
		in_list(Friend,[richard,_,_,W2,_]),

                write("Australian is "),write(W1),nl,write("Richard plays "),write(W2),nl,

		write(Friend), !.
%������� 3 ��� ����� � ����, ����� � ������ ������ �� ��������������,
%���������� � ���������� ����������� ������������. ���� ���� ���������,
% �� ������ �� �����. ���� ����� �� �����, �� ���� � ���������. ����
% ������
%�� ���������, �� ����� � �����. ��� ������ �����?

pr_friends1 :- Friend1 = [_, _, _],

    in_list(Friend1, [petr,_]),
    in_list(Friend1, [roman,_]),
    in_list(Friend1, [sergei,_]),

    in_list(Friend1, [_,math]),
    in_list(Friend1, [_,chemic]),
    in_list(Friend1, [_,physics]),

      (not(in_list(Friend1,[roman,physics])) ->in_list(Friend1,[petr,math]);
     in_list(Friend1,[petr,chemic]), in_list(Friend1,[roman,physics])),


    (in_list(Friend1,[petr,math]) -> not(in_list(Friend1,[sergei,physics]));
     in_list(Friend1,[sergei,math]), not(in_list(Friend1,[petr,math]))),



    (not(in_list(Friend1,[sergei,math])) -> in_list(Friend1,[roman,chemic]);
     not(in_list(Friend1,[roman,chemic])),in_list(Friend1,[sergei,math])),







     in_list(Friend1,[roman,WH]),

     write(WH),nl,

     write(Friend1),!.

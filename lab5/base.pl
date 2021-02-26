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

pr_drinkk:- Drinks=[_,_],



                ( in_list(Drinks,[water,glass]);
                in_list(Drinks,[water,jug])),

                 ( in_list(Drinks,[milk,glass]);
                in_list(Drinks,[milk,jug]);
                in_list(Drinks,[milk,pot])),

                 ( in_list(Drinks,[lemonade,glass]);
                in_list(Drinks,[lemonade,jug]);
                 in_list(Drinks,[lemonade,bottle])),




                 (((sprava_next([_,lemonade],[_,jug],Drinks);
                 sleva_next([_,lemonade],[kvass,_],Drinks));
                 sprava_next([_,lemonade],[kvass,_],Drinks);
                 sleva_next([_,lemonade],[_,jug],Drinks))),


                (((sprava_next([glass,_],[_,pot],Drinks);
                 sleva_next([glass,_],[milk,_],Drinks));
                 sprava_next([glass,_],[milk,_],Drinks);
                 sleva_next([glass,_],[_,pot],Drinks))),


                in_list(Drinks,[glass,s1]),
		in_list(Drinks,[jug,s2]),
                in_list(Drinks,[pot,s3]),
		in_list(Drinks,[bottle,s4]),
		write(s1),nl,write(s2),nl,write(s3),nl,write(s4).
	%	write(WHO1),nl,write(WHO2),nl,write(WHO3),nl,write(WHO4).

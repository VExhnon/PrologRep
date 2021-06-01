:- dynamic  univers/2.
:- dynamic film/2.
:- dynamic wep/2.
:- dynamic mow/2.
:- dynamic mask/2.
:- dynamic fly/2.
read_str(A) :-
  get0(X),
  r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-
  append(B, [X], B1),
  get0(X1),
  r_str(X1, A, B1).

univers_r(X, Y) :-
  repeat,
  ( univers(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract( univers(X, Y)));
  X = nil, Y = nil).

film_r(X, Y) :-
  repeat,
  (film(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(film(X, Y)));
  X = nil, Y = nil).

wep_r(X, Y) :-
  repeat,
  (wep(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(wep(X, Y)));
  X = nil, Y = nil).

mow_r(X, Y) :-
  repeat,
  (mow(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(mow(X, Y)));
  X = nil, Y = nil).

mask_r(X, Y) :-
  repeat,
  (mask(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(mask(X, Y)));
  X = nil, Y = nil).

fly_r(X, Y) :-
  repeat,
  (fly(X, Y) ->
  (nl, write(X),
  nl, write(Y),
  write("."),
  retract(fly(X, Y)));
  X = nil, Y = nil).

prTell :-
  tell('D:/swipl/PrologRep/lab11/univers.txt'), univers_r(X1, _), X1 = nil, told,
  tell('D:/swipl/PrologRep/lab11/film.txt'),  film_r(X2, _),  X2 = nil, told,
  tell('D:/swipl/PrologRep/lab11/wep.txt'),  wep_r(X3, _),  X3 = nil, told,
  tell('D:/swipl/PrologRep/lab11/mow.txt'),  mow_r(X4, _),  X4 = nil, told,
  tell('D:/swipl/PrologRep/lab11/mask.txt'), mask_r(X5, _), X5 = nil, told,
  tell('D:/swipl/PrologRep/lab11/fly.txt'), fly_r(X6, _), X6 = nil, told.

prSee :-
  see('D:/swipl/PrologRep/lab11/univers.txt'), get0(Sym1), read_data(Sym1, 1), seen,
  see('D:/swipl/PrologRep/lab11/film.txt'),  get0(Sym2), read_data(Sym2, 2), seen,
  see('D:/swipl/PrologRep/lab11/wep.txt'),  get0(Sym3), read_data(Sym3, 3), seen,
  see('D:/swipl/PrologRep/lab11/mow.txt'),  get0(Sym4), read_data(Sym4, 4), seen,
  see('D:/swipl/PrologRep/lab11/mask.txt'), get0(Sym5), read_data(Sym5, 5), seen,
  see('D:/swipl/PrologRep/lab11/fly.txt'), get0(Sym6), read_data(Sym6, 6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-
  read_str(Lang),
  name(X, Lang),
  read(Y),
  (
    Flag = 1 ->
    asserta( univers(X, Y));
    (
      Flag = 2 ->
      asserta(film(X, Y));
      (
        Flag = 3 ->
        asserta(wep(X, Y));
        (
          Flag = 4 ->
          asserta(mow(X, Y));
            (
              Flag = 5->
          asserta(mask(X, Y));
          asserta(fly(X,Y)))
        )
      )
    )
  ),
  get0(Sym),
  read_data(Sym, Flag).


question1(X1):-	write("This hero from wich universe: marvel or DC?"),nl,
				write("1. Marvel"),nl,
				write("2. DC"),nl,
				read(X1).

question2(X2):-	write("Is there a film about this character?"),nl,
				write("0. Yes"),nl,
				write("1. No"),nl,
                      read(X2).


question3(X3):-	write("This character have any weapon or another facilities?"),nl,
				write("1. Yes"),nl,
				write("0. No"),nl,
				read(X3).
question4(X4):-	write("Can this person overcome the distance so fast?"),nl,
				write("0. Yes"),nl,
				write("1. No"),nl,
				read(X4).

question5(X5):-	write("This character wears a mask?"),nl,
                      write("1. Yes"),nl,
				write("0. No"),nl,
				read(X5).
question6(X6):-	write("Can this person fly?"),nl,
				write("1. Yes"),nl,
				write("0. No"),nl,
				read(X6).


addHero(Hero, X1, X2, X3, X4, X5,X6) :-
  append('D:/swipl/PrologRep/lab11/univers.txt'),
  nl, write(Hero), nl, write(X1), write("."), told,

  append('D:/swipl/PrologRep/lab11/film.txt'),
  nl, write(Hero), nl, write(X2), write("."), told,

  append('D:/swipl/PrologRep/lab11/wep.txt'),
  nl, write(Hero), nl, write(X3), write("."), told,

  append('D:/swipl/PrologRep/lab11/mow.txt'),
  nl, write(Hero), nl, write(X4), write("."), told,

  append('D:/swipl/PrologRep/lab11/mask.txt'),
  nl, write(Hero), nl, write(X5), write("."), told,

  append('D:/swipl/PrologRep/lab11/fly.txt'),
  nl, write(Hero), nl, write(X6), write("."), told.

pr :-
  prSee,
  question1(X1),
  question2(X2),
  question3(X3),
  question4(X4),
  question5(X5),
  question6(X6),
  ( univers(X, X1),
  film(X, X2),
  wep(X, X3),
  mow(X, X4),
  mask(X, X5),
    fly(X,X6),
  write(X);
  (write("Hero -> "),
  read(Hero),
  asserta(univers(Hero, X1)),
  asserta(film(Hero, X2)),
  asserta(wep(Hero, X3)),
  asserta(mow(Hero, X4)),
  asserta(mask(Hero, X5)),
   asserta(fly(Hero, X6)),
  prTell, nl,
  write("Hero was added!")
  )).

max(X,Y,Z):-X>Y,Z is X,write(Z);X<Y,Z is Y,write(Z).

max(X,Y,U,Z):-X>Y,X>U,Z is X,write(Z);Y>X,Y>U,Z is Y,write(Z);U>X,U>Y,Z is U ,write(Z).

factorial(0,1):-!.
factorial(X,Y):-X1 is X-1,factorial(X1,Y1),Y is X*Y1.

facto(1,Z,Z):-!.
facto(N,Z,X):-Z1 is Z*N, N1 is N-1, facto(N1,Z1,X).
fact1(N,X):-facto(N,1,X).


fib(1,1).
fib(0,0).
fib(X,Y):-X>1,X1 is X-1, X2 is X-2, fib(X1,Y1),fib(X2,Y2),Y is Y1+Y2.

fib(1, _, CurX2, CurX2) :- !.
fib(2, _, CurX2, CurX2) :- !.
fib(N, CurX1, CurX2, X) :- CurX3 is CurX1 + CurX2, N1 is N - 1, fib(N1, CurX2, CurX3, X).
fibN(N, X) :- fib(N, 1, 1, X).

numbers(0,0):-!.
numbers(X,Y):-X1 is (X mod 10),X2 is (X div 10),numbers(X2,Y1),Y is Y1+X1.

numbers(0, CurX, CurX) :- !.
numbers(Y, CurX, X) :- Mod is Y mod 10, Y1 is Y div 10, CurX1 is CurX + Mod, numbers(Y1, CurX1, X).
numbers1(Y, X) :- numbers(Y, 0, X).


minOfNum(X, X) :- X div 10 =:= 0, !.
minOfNum(Y, X) :- X2 is (Y mod 10), Y1 is (Y div 10), minOfNum(Y1, X1), (X1 < X2 -> X is X1; X is X2).


%composition of digit numbers, that don't division on 5
divOfNum(Y, X) :- Y =:= 0,X is 1 ,!.
divOfNum(Y, X) :- Mod is (Y mod 10), Y1 is (Y div 10), divOfNum(Y1, X1), (Mod \== 5 -> X is (X1 * Mod); X is X1).

minOfNum(0, 10, 0) :- !.
minOfNum(0, CurX, CurX) :- !.
minOfNum(Y, CurX, X) :- CurX1 is (Y mod 10), Y1 is (Y div 10), (CurX1 < CurX -> CurX2 is CurX1; CurX2 is CurX), minOfNum(Y1, CurX2, X).
minOfNum1(Num, Min) :- minOfNum(Num, 10, Min).


divOfNum(Num, Divis, Divis) :- Num = 0,Divis is CurDivis,!.
divOfNum(Num, CurDivis, Divis) :- Mod is (Num mod 10), Num1 is (Num div 10), (Mod \== 5 -> CurDivis1 is (CurDivis * Mod); CurDivis1 is CurDivis), divOfNum(Num1, CurDivis1, Divis).
divOfNumN(Num, Divis) :- divOfNum(Num, 1, Divis), Divis is Divis.

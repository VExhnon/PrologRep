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

numbers(0,0):-!.
numbers(X,Y):-X1 is (X mod 10),X2 is (X div 10),numbers(X2,Y1),Y is Y1+X1.

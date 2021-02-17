max(X,Y,Z):-X>Y,Z is X,write(Z);X<Y,Z is Y,write(Z).

max(X,Y,U,Z):-X>Y,X>U,Z is X,write(Z);Y>X,Y>U,Z is Y,write(Z);U>X,U>Y,Z is U,write(Z).

factorial(0,1):-!.
factorial(X,Y):-Z is X-1,factorial(Z,W),Y is X*W.


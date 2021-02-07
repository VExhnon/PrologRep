man(adam).
man(albert).
man(arnold).
man(chad).
man(brian).
man(dirk).
man(ernest).
man(gabriel).
man(harry).
man(felix).
man(james).

woman(melanie).
woman(zoe).
woman(emma).
woman(sophia).
woman(irene).
woman(vivian).
woman(rebecca).
woman(barbara).
woman(bridget).
woman(deborah).

parent(adam,albert).
parent(adam,melanie).
parent(adam,arnold).

parent(albert,chad).
parent(albert,brian).

parent(barbara,chad).
parent(barbara,brian).


parent(arnold,dirk).
parent(arnold,sophia).

parent(bridget,dirk).
parent(bridget,sophia).

parent(chad,irene).
parent(chad,ernest).

parent(zoe,irene).
parent(zoe,ernest).

parent(brian,gabriel).
parent(brian,vivian).

parent(emma,gabriel).
parent(emma,vivian).

parent(dirk,harry).
parent(dirk,rebecca).

parent(deborah,harry).
parent(deborah,rebecca).

parent(sophia,felix).
parent(james,felix).

mans:-man(X),write(X),write(" "),fail.
womans:-woman(X),write(X),write(" "),fail.
child(X):-parent(X,Y),write(Y),write(" "),fail.
mother1(X,Y):-parent(X,Y),woman(X).
mother2(X):-parent(Y,X),woman(Y),write(Y),write(" ").
daughter1(X,Y):-woman(X),parent(Y,X).
daughter2(X):-woman(Y),parent(X,Y),write(Y).








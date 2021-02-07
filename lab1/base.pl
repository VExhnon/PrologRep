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
brother1(X, Y):-man(Y),parent(Z,X),parent(Z,Y),not(X=Y).
brother2(X):-man(X),man(Y),parent(Z,X),parent(Z,Y),write(Y),write(" "),fail.
wife1(X, Y):-woman(X),man(Y),parent(X,Z),parent(Y,Z).
wife2(X):-man(X),woman(Y),parent(X,Z),parent(Y,Z),write(Y),write(" ").
b_s(X,Y):-parent(Z,X),parent(Z,Y).
s_b(X):-parent(Z,Y),parent(Z,X),write(Y),write(" "),fail.
grand_pa(X, Y):-man(X),parent(Z,Y),parent(X,Z).
grand_pas(X):-man(Y),parent(Z,X),parent(Y,Z),write(Y),write(" "),fail.
grand_ma(X, Y):-woman(X),wife1(X,Z),parent(H,Y),parent(Z,H).
grand_mas(X):-woman(Y),parent(Z,X),parent(H,Z),wife1(Y,H),write(Y),write(" "),fail.





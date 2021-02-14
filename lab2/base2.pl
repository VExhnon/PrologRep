%1 - marvel, 0 - DC
univers(spiderman,1).
univers(wolverine,1).
univers(ironman,1).
univers(captainamerica,1).
univers(thor,1).
univers(hulk,1).
univers(deadpool,1).
univers(ghostrider,1).
univers(blackpanther,1).
univers(antman,1).
univers(wasp,1).
univers(venom,1).
univers(catwoman,0).
univers(aquaman,0).
univers(flash,0).
univers(batman,0).
univers(batgirl,0).
univers(vibe,0).
univers(reverseflash,0).
univers(kidflash,0).
univers(greenarrow,0).
univers(greenlantern,0).
univers(shazam,0).
univers(superman,0).
univers(wonderwoman,0).

film(spiderman,1).
film(wolverine,1).
film(ironman,1).
film(captainamerica,1).
film(thor,1).
film(hulk,1).
film(deadpool,1).
film(ghostrider,1).
film(blackpanther,1).
film(antman,1).
film(wasp,0).
film(venom,1).
film(catwoman,1).
film(aquaman,1).
film(flash,0).
film(batman,1).
film(batgirl,0).
film(vibe,0).
film(reverseflash,0).
film(kidflash,0).
film(greenarrow,0).
film(greenlantern,1).
film(shazam,1).
film(superman,1).
film(wonderwoman,1).

wep(spiderman,1).
wep(wolverine,0).
wep(ironman,1).
wep(captainamerica,1).
wep(thor,1).
wep(hulk,0).
wep(deadpool,1).
wep(ghostrider,1).
wep(blackpanther,1).
wep(antman,1).
wep(wasp,1).
wep(venom,0).
wep(catwoman,1).
wep(aquaman,1).
wep(flash,0).
wep(batman,1).
wep(batgirl,1).
wep(vibe,1).
wep(reverseflash,0).
wep(kidflash,0).
wep(greenarrow,1).
wep(greenlantern,1).
wep(shazam,0).
wep(superman,0).
wep(wonderwoman,1).

mow(spiderman,1).
mow(wolverine,0).
mow(ironman,1).
mow(captainamerica,0).
mow(thor,1).
mow(hulk,1).
mow(deadpool,0).
mow(ghostrider,1).
mow(blackpanther,0).
mow(antman,1).
mow(wasp,1).
mow(venom,1).
mow(catwoman,1).
mow(aquaman,1).
mow(flash,0).
mow(batman,0).
mow(batgirl,0).
mow(vibe,1).
mow(reverseflash,1).
mow(kidflash,1).
mow(greenarrow,0).
mow(greenlantern,1).
mow(shazam,1).
mow(superman,1).
mow(wonderwoman,1).

mask(spiderman,1).
mask(wolverine,0).
mask(ironman,1).
mask(captainamerica,1).
mask(thor,0).
mask(hulk,0).
mask(deadpool,1).
mask(ghostrider,0).
mask(blackpanther,1).
mask(antman,1).
mask(wasp,1).
mask(venom,1).
mask(catwoman,1).
mask(aquaman,0).
mask(flash,1).
mask(batman,1).
mask(batgirl,1).
mask(vibe,1).
mask(reverseflash,1).
mask(kidflash,1).
mask(greenarrow,1).
mask(greenlantern,1).
mask(shazam,0).
mask(superman,0).
mask(wonderwoman,0).

fly(spiderman,0).
fly(wolverine,0).
fly(ironman,1).
fly(captainamerica,0).
fly(thor,0).
fly(hulk,0).
fly(deadpool,0).
fly(ghostrider,0).
fly(blackpanther,0).
fly(antman,0).
fly(wasp,1).
fly(venom,0).
fly(catwoman,0).
fly(aquaman,0).
fly(flash,0).
fly(batman,0).
fly(batgirl,0).
fly(vibe,0).
fly(reverseflash,0).
fly(kidflash,0).
fly(greenarrow,0).
fly(greenlantern,1).
fly(shazam,1).
fly(superman,1).
fly(wonderwoman,0).

hregen(spiderman,0).
hregen(wolverine,1).
hregen(ironman,0).
hregen(captainamerica,0).
hregen(thor,1).
hregen(hulk,1).
hregen(deadpool,1).
hregen(ghostrider,1).
hregen(blackpanther,0).
hregen(antman,0).
hregen(wasp,0).
hregen(venom,1).
hregen(catwoman,0).
hregen(aquaman,1).
hregen(flash,1).
hregen(batman,0).
hregen(batgirl,0).
hregen(vibe,0).
hregen(reverseflash,1).
hregen(kidflash,1).
hregen(greenarrow,0).
hregen(greenlantern,1).
hregen(shazam,1).
hregen(superman,1).
hregen(wonderwoman,1).
% 0 - red, 1 - green, 2 - yellow, 3 - black, 4 - blue, 5 - none
cost(spiderman,0).
cost(wolverine,5).
cost(ironman,0).
cost(captainamerica,4).
cost(thor,5).
cost(hulk,1).
cost(deadpool,0).
cost(ghostrider,3).
cost(blackpanther,3).
cost(antman,0).
cost(wasp,2).
cost(venom,3).
cost(catwoman,3).
cost(aquaman,2).
cost(flash,0).
cost(batman,3).
cost(batgirl,3).
cost(vibe,5).
cost(reverseflash,2).
cost(kidflash,2).
cost(greenarrow,1).
cost(greenlantern,1).
cost(shazam,0).
cost(superman,4).
cost(wonderwoman,0).



question1(X1):- write("This hero from wich universe: marvel or DC?"),nl,
write("1. Marvel"),nl,
write("0. DC"),nl,
read(X1).

question2(X2):- write("Is there a film about this character?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X2).

question3(X3):- write("This character have any weapon or another facilities?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X3).

question4(X4):- write("Can this person overcome the distance so fast?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X4).

question5(X5):- write("This character wears a mask?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X5).

question6(X6):- write("Can this person fly?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X6).

question7(X7):- write("This character have highregen power?"),nl,
write("1. Yes"),nl,
write("0. No"),nl,
read(X7).

question8(X8):- write("Which color is hero(or his costume)?"),nl,
write("5. Neutral"),nl,
write("4. Blue"),nl,
write("3. Black"),nl,
write("2. Yellow"),nl,
write("1. Green"),nl,
write("0. Red"),nl,
read(X8).


pr:- question1(X1),question2(X2),question3(X3),question4(X4),
question5(X5),question6(X6),question7(X7), question8(X8),
univers(X,X1),film(X,X2),wep(X,X3),mow(X,X4),
mask(X,X5),fly(X,X6),hregen(X,X7),cost(X,X8),
write(X).

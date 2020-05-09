/*  Definitions of logical plus and minus on Church numerals */
lplus(0,Y,Y).
lplus(s(X),Y,s(Z)) :- lplus(X,Y,Z).
ltimes(0,_,0).
ltimes(s(X),Y,Z) :- ltimes(X,Y,XY), lplus(XY,Y,Z).

/* Predicates are defined using Logical Arithmetic, i.e. numbers expressed as Church Numerals*/

/* Predicate fibonacci(X,Y) which succeeds when Y is the Xth Fibonacci number */
fibonacci(0,0).
fibonacci(s(0),s(0)).
fibonacci(s(s(X)),Y) :-  fibonacci(s(X),A),fibonacci(X,B), lplus(A,B,Y).

/* Predicate factorial(X,Y) which succeeds when Y is the factorial of X */
factorial(0,s(0)).
factorial(s(X),Y) :- factorial(X,Z), ltimes(s(X),Z,Y).

/* Predicate listsum(N,L) that finds all lists L of positive numerals that sum to N */
listsum(0,[]).
listsum(X,[A|Y]) :- lplus(A,B,X), A\==0, listsum(B,Y).

/*  Prolog predicates for performing the set operations. Set is an unsorted list of Prolog atoms with no duplicate elements */

/* union(S1,S2,Out) yields the union of sets S1 and S2 in Out */

contains(X,[X|_]).
contains(X,[H|T]) :- X\==H, contains(X,T).

union([],Y,Y).
union([H1|T1],L2,[H1|T3]) :- not(contains(H1,L2)), union(T1,L2,T3).
union([H1|T1],L2,T3) :- contains(H1,L2), union(T1,L2,T3).

/* intersection(S1,S2,Out) yields the intersection of sets S1 and S2 in Out */

intersection([],_,[]).
intersection([H1|T1],L2,[H1|T3]) :- contains(H1,L2),intersection(T1,L2,T3).
intersection([H1|T1],L2,T3) :- not(contains(H1,L2)),intersection(T1,L2,T3).

/* setdiff(S1,S2,Out) yields the subtraction of set S2 from S1 in Out */

remove(X,[X|T],T).
remove(X,[Y|T1],[Y|T2]) :- X\==Y, remove(X,T1,T2).

setdiff(Y,[],Y).
setdiff(L1,[H2|T2],L3) :- contains(H2,L1),remove(H2,L1,L1New),setdiff(L1New,T2,L3).
setdiff(L1,[H2|T2],L3) :- not(contains(H2,L1)),setdiff(L1,T2,L3).


/* subset(S1,S2) succeeds if S1 is a subset of S2 */

subset(S1,S2) :- intersection(S1,S2,S1).

/*  Interpreter for the untyped λ-calculus in Prolog. Structure is defined as follows: lam(x, e) to represent the abstraction λx.e, the structure app(e1,e2) to represent the application e1e2, and the structure var(x) to represent variable expressions x. For example, the λ-calculus expression λx.((λy.y)x) would be represented by the Prolog structure lam(x,app(lam(y,var(y)),var(x))) */

/* Interpreter Part-1: Predicate cas(E1,E2,X,E3) that succeeds if and only if expression E3 is the result of the capture-avoiding substitution E1[E2/X]. */

cas(var(X),E,var(X),E).
cas(var(Y),_,var(X),var(Y)) :- X\==Y.
cas(lam(X,E0),_,var(X),lam(X,E0)).
cas(lam(Y,E0),E,var(X),lam(Y,E2)) :-  X\==Y,cas(E0,E,var(X),E2).
cas(app(E1,E2),E,var(X),app(E1New,E2New)) :- cas(E1,E,var(X),E1New), cas(E2,E,var(X),E2New).

/* Interpreter Part-2: Predicate eval(E1,E2) that succeeds if and only if the judgment E1 ⇓ E2 holds */

eval(var(V),var(V)).
eval(lam(V,E),lam(V,E)).
eval(app(lam(V,E1),E2), E4) :- cas(E1,E2,var(V),E3),eval(E3,E4).
eval(app(app(E1,E2), E3),EResult) :- eval(app(E1,E2),E1New),eval(app(E1New,E3),EResult).

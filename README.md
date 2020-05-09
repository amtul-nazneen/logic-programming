# Logic Programming - Prolog
Defining predicates and an interpreter for untyped λ-calculus in Prolog

## Overview
* fibonacci(X,Y).
* factorial(X,Y).
* Set Operations - union(X,Y,Z). intersection(X,Y,Z). setDiff(X,Y,Z). subset(X,Y).
* Interpreter for untyped λ-calculus - Predicates for capture-avoiding substitution and expression evaluation

## Getting Started
These instructions will get you a copy running on your local machine for development and testing purposes. 


### Softwares/SDKs
1. SWI-Prolog

### Steps to run the application
1. Type `swipl` in your terminal and hit enter
2. Type `consult(source).` and hit enter, which is nothing but the filename without the `.pl` extension
3. Enter queries at the Prolog prompt. Provide `;` to continue the prolog search and `.` to end it
  * `fibonacci(X,s(s(s(0)))).`
  * `eval(app(lam(x, app(var(x), lam(x, lam(y, var(x))))), lam(x, var(x))), Z).`
  * `eval(app(lam(x, app(var(x), lam(x, lam(y, var(x))))), app(app(lam(x, lam(y, lam(b, app(app(var(b), var(x)), var(y))))), lam(x, lam(y, var(y)))), lam(x, var(x)))), Z).`
4. Each time you make codechanges in `source.pl`, perform the consult step again and re-test your changes

# Logic Programming - Prolog
Defining predicates and an interpreter for untyped λ-calculus in Prolog

## Overview
* fibonacci(X,Y).
* factorial(X,Y).
* Set Operations - union(X,Y,Z). intersection(X,Y,Z). setDiff(X,Y,Z). subset(X,Y).
*  Interpreter for untyped λ-calculus - Predicates for capture-avoiding substitution and expression evaluation

## Getting Started
These instructions will get you a copy running on your local machine for development and testing purposes. 


### Softwares/SDKs
1. SWI-Prolog

### Steps to run the application
1. Type `swipl` in your terminal and hit enter
2. Type `consult(source).` and hit enter
3. Enter queries at the Prolog prompt
* `./simpl isprime.sim 4`
* `./simpl factorial.sim 5`
* `as`
4. Each time you make codechanges in `source.pl`, perform the consult step again and re-test your changes

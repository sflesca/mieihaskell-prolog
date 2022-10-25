:- dynamic(foo/2).

foo(a,1).
foo(b,Y) :- foo(a,X), Y  =  X +  1.

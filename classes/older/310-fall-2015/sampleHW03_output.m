% solns to programming HW 3
%
% My name and info

disp(' ')
% define the vector of coefficients for p(x)
a=[2 0 -3];    
% store 3 to x
x=3;
% call the functions and display the results
% N.B.  the two apostrophes are needed so that one appears in the string
disp('The value of p(x) and p''(x) at x = 3  is ....')
[hornerEval(a,3) hornerDerivEval(a,3)]
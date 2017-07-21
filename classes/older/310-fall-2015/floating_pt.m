% Demos from class on Sept 10, 2015
%
% The show off some of the pitfalls of floating point arithmetic

% These lines will display the range of decimal numbers for single and
% double precision arithmetic in MATLAB
str1 = sprintf('The range for single is:\n\t%g to %g and\n\t %g to  %g', -realmax('single'), -realmin('single'), realmin('single'), realmax('single'));
disp(' ')
disp(str1)

str2 = sprintf('The range for double is:\n\t%g to %g and\n\t %g to  %g', -realmax, -realmin, realmin, realmax);
disp(' ')
disp(str2)

% This command will display machine epsilon for double precision arithmetic
eps

% Things to watch out for:
%
% Round-off error
disp(' ')
disp('The fraction 4/3 is not exactly representable as a floating point number.')
disp('The following should be zero, but because of round-off error is machine epsilon.')   
e = 1 - 3*(4/3-1)

disp(' ')
% .1 is also not exactly representable as a binary number.  This loop has
% surprising results.
a=0.0;
for i=1:10
   a = a + .1
   pause
end

% The test if a is equal to 1 yields false!
a==1
pause

% The order of operations can matter!
% 
% Eg. a + (b+c) ~= (a + b) + c    
disp(' ')
disp('Show that a + (b+c) ~= (a + b) + c is possible in floating point arithmetic')   
disp(' ')
a=1e-16, b=1, c=-1e-16
disp(' ')
x=a+b+c
y=a+c+b
x==y
pause

% Even the sin(pi) can be hard to compute exactly!
disp(' ')
disp('The value of sin(pi) is ....')
sin(pi)

% An example of subtractive cancellation
pause
format shorte

endTable=-30;
h=[2.^[-1:-1:endTable]];
ctr=[1:length(h)]';
% take the transpose
h=h';
tableValues=[ctr h exp(h) exp(h)-1  (exp(h)-1)./h]

disp('  d                h              exp(h)-1          (exp(h)-1)/h')
% since endTable is negative, need to multiply by -1 for looping
for i=1:-endTable
  hh=h(i);
  str=sprintf('  %2d    %0.10f     %0.15f     %0.15f', i, hh, exp(hh)-1, (exp(hh)-1)/hh);
  disp(str)
  pause
end

pause
disp('Now the table in SINGLE precision.')
disp('   d                    h              exp(h)-1          (exp(h)-1)/h')
% since endTable is negative, need to multiply by -1 for looping
for i=1:-endTable
  hh=single(h(i));
  str=sprintf('  %2d    %0.15f     %0.15f     %0.15f', i, single(hh), single(exp(hh)-1), single((exp(hh)-1)/hh));
  disp(str)
  pause
end
  


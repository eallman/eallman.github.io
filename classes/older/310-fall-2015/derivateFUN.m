function [output] = derivate(fname, x, h, M)
%
%  function [output] = derivate(fname, x, h, M)
%
%  Compute f'(x) using a right, left and central difference approximation
%
%  The arguments for this function are:
%
%  fname:   a string with the name of the function to differentiate
%  x:       the point at which to compute f'
%  h:       a small number used initially in the difference quotient
%  M:       number of times to halve h in computing derivatives
%
%  function [output] = derivate(fname, x, h, M)
% 
%
%  Here output will show [h Left Right Central] estimates.
%
%  For class Sept 22, 2015

f = inline(fname);

output = [];
for k = 1:M
    rightestimate = (f(x+h) - f(x))/h;
    leftestimate = (f(x) - f(x-h))/h;
    centerestimate = (f(x+h) - f(x-h))/(2*h);
    output = [output; h rightestimate leftestimate centerestimate];
    h = h/2;
end

disp(' ')
disp(sprintf('       Your estimates for the derivative of %s at x = %g are', fname, x))
disp(' ')
disp(sprintf('          h                Left               Right              Center'))
disp(' ')
disp(output)



function [sum err] = trapCorr(fname, a, b, n, varargin)

% trapCorr(function, begin, end, n)
%
% Usage:  function [sum err] = trapCorr(fname, a, b, n, varargin)
%
% If two additional arguments are given (varargin), then they are
% f'(a) and f'(b) for the corrected trapezoid rule
%
% If yet another additional argument is given, then it is the true value of
% the definite integral and used to compute the error I(f) - T_n(f)
%
% Give the trapzoid rule estimate for integral of f from a to b dx
% Here n is the number of trapezoids, i.e. the number of equally spaced
% subintervals.
%
% December 9, 2015

f = inline(fname);

err=[];

sum = 0;
h = (b - a)/n;
sum = f(a);

for i = 1:n - 1,
  sum = sum + 2*(f(a + i*h));
end

sum = sum + f(b);
sum = (h/2)*sum;
str=sprintf('Composite Trapezoid Rule:            %5.12g',sum);
disp(str);

nargin=length(varargin);
if (nargin>0)
  fpa=varargin{1};
  fpb=varargin{2};
  sumC=sum-1/12*h^2*(fpb-fpa);
  str=sprintf('Composite Corrected Trapezoid Rule:  %5.12g',sumC);
  disp(str);
  sum=[sum sumC];
  if (nargin>2)
    trueValue=varargin{3};
    err=trueValue-sum;
  end
end



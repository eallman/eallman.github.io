function [sum err] = simpson(fname, a, b, num, varargin)
%
% Simpson's Rule
% function [sum err] = simpson(fname, a, b, num, varargin)
%
% Usage: function [sum err] = simpson(fname, a, b, num, varargin)
%
% If an additional argument is sent, it is the true value of the definite
% integral to be used to compute the error I(f) - S_n(f)

f = inline(fname);

err=[];

sum = 0;
h = (b - a)/num;
sum = f(a);
for i = 1:num - 1,
    if(mod(i,2) == 0)
        sum = sum + 2*f(a + i*h);
    else
        sum = sum + 4*f(a + i*h);
    end
end
sum = sum + f(b);
sum = (h/3)*sum;
str=sprintf('Composite Simpson''s Rule:  %5.12g',sum);
disp(sum);

nargin=length(varargin);
if (nargin>0)
    trueValue=varargin{1};
    err=trueValue-sum;
  end
end


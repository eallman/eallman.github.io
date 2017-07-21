function yValues = functionEval(ff, xValues)

% function yValues = functionEval(ff, xValues)
%   
% arguments:
%      ff:       string containing the Newton interpolant
%      xValues:  vector of x values for evaluating ff
%
% returns the yValues = ff(xValues)
%
% This function is for student use.  Modify as desired.

% define function and determine how long the vector of inputs is
f=inline(ff);
l=length(xValues);

% set up vector for storing ff(xValues)
yValues=zeros(1,l);

for i=1:l
  yValues(i)=f(xValues(i));
end;

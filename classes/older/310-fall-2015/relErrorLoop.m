% relErrorLoop.m
%
% Loop over estimates to e and display the relative error
%
% For class on Tuesday, September 8, 2015

% select the formatting of numbers to be `long' and `exponential'
% type "help format" for display options or "doc format"
format longe

relError=[];

% for loop
for j=0:8
  x=floor(exp(1)*10^j)/10^j
  relError=[relError; x abs(exp(1)-x)/exp(1)];
end

relError
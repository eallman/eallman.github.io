function taylor(n)

%  taylor.m
%  
%  code for MATLAB demonstration on day 1 of class
%
%  Find the Taylor approximation of degree n to f(x) = e^x around 0
%  Then plot f(x) and p(x).
% 
%  There is a function version which can easily be converted to a script version.
%
%  Usage: 
%          taylor(n)
%          
%  ESA
%  Sept 3, 2015


% Range of x values for plotting
xValues=[-1:.05:1];

% The value of f(x) = e^x at x = 0 is 1.
f0 =1;
p = f0;

% open a figure window for plotting
figure;
expValues=exp(xValues);
plot(xValues,expValues,'k');
xlabel('e^x is in black');
% do NOT erase contents of figure while improving the plot
hold on;

% start computing the factorials in the Taylor expansion
currentFactorial = 1;

for i=1:n
  currentFactorial=currentFactorial*i;
  p=p+(xValues.^i)/currentFactorial;
  
  plot(xValues,p);
  t1=sprintf('The %d th Taylor polynomial',i);
  title(t1);
  drawnow;
  pause;
end
  
plotError=1;
if plotError
  figure;
  plot(xValues,expValues-p);
  title('Error')
end;




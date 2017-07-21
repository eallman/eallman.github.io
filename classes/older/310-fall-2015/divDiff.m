function c = divDiff(x,y)

% function to compute divided differences code for coefficients in Newton
% interpolating polynomial
%
%  Usage:  function c = divDiff(x,y)
%
%  November 2, 2015

if length(x) ~= length(y)
  disp('Vectors of x and y are not of the same length.  Stopping ....')
  return;
end

n = length(x);

% Vector for storing the coefficients
c = zeros(1,n);

% indices off by 1 that is, c(k) is actually c_{k-1}
c(1) = y(1);

for k=2:n
  % 
  %
  w=1;
  p = 0;
  for j=1:k-1
    % 
    %
    p = p + c(j)*w;
    % 
    w = w*(x(k)-x(j));
  end
  %
  %
  c(k) = (y(k)-p)/w;
end
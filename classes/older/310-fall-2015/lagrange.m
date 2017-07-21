function [Lpoly] = lagrange(xdata, ydata)

% function [Lpoly] = lagrange(xdata, ydata)
%
% find the lagrange interpolant of (xdata,ydata)
%
%    arguments:
%        xdata:  nodes
%        ydata:  data values at nodes
%

clf
% extra space for plotting
es=2;
plot(xdata,ydata,'ro')
hold on
x_min=min(xdata)-es;
x_max=max(xdata)+es;
y_min=min(ydata)-es;
y_max=max(ydata)+es;
% control size of plot and plot axes
axis([x_min x_max y_min y_max ])
plot([x_min x_max],[0 0],'k');
plot([0 0],[y_min y_max],'k');
grid on

pause

tic
n = length(xdata);
L = '0';

for k = [1:n]
  numer = '1';
  denom = 1;
  for j = [1:n]
    if j ~= k
      denom = denom*(xdata(k) - xdata(j));
      factor = sprintf('*(x - %d)', xdata(j));
      numer = strcat(numer,factor);
    end
  end
  l = strcat('(',numer,')/',num2str(denom));
  if (ydata(k)~=0)
    L = strcat(L,' + ',num2str(ydata(k)),'*', l);
  end;
end

disp(' ')
toc
Lpoly = L;
disp(L)

pause
ezplot(L)
axis([x_min x_max y_min y_max ])
plot([x_min x_max],[0 0],'k');
plot([0 0],[y_min y_max],'k');
grid on

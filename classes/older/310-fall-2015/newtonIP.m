function [c, Npoly] = newtonIP(xdata, ydata)

% function [c, Npoly] = newtonIP(xdata, ydata)
%
% find the Newton interpolant of (xdata,ydata)
%
% arguments:
%      xdata, ydata of interpolating points
%
% returns Newton interpolant Npoly and coefficients c
%
% This function is for student use.  Modify as desired.

precision=16;

% Uncomment for plotting
%
% clf
% % extra space for plotting
% es=2;
% plot(xdata,ydata,'ro')
% hold on
% x_min=min(xdata)-es;
% x_max=max(xdata)+es;
% y_min=min(ydata)-es;
% y_max=max(ydata)+es;
% % control size of plot and plot axes
% axis([x_min x_max y_min y_max ])
% plot([x_min x_max],[0 0],'k');
% plot([0 0],[y_min y_max],'k');
% grid on
% 
% pause

% convert to column matrix if needed
if (size(ydata,1)==1)
  ydata=ydata';
end;

tic
n = length(xdata);
A = zeros(n);
A(:,1) = 1;

for k = [2:n]          % row
entry = 1;
   for j = [1:n-1]     % column
      entry = entry*(xdata(k) - xdata(j));
      A(k, j+1) = entry;
   end
end
c = A \ ydata

N = num2str(c(1),precision);
for k = [1:n-1]
   N = strcat(N, ' +', num2str(c(k+1),precision));
   for j = [1:k]
      N = strcat(N,'*(x - ', num2str(xdata(j),precision), ')');
   end
end

disp(' ')
toc
Npoly = N;
disp(N)

% Uncomment if want to see graphics
%
% pause
% ezplot(N)
% axis([x_min x_max y_min y_max ])
% plot([x_min x_max],[0 0],'k');
% plot([0 0],[y_min y_max],'k');
% grid on
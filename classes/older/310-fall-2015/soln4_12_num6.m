xx=linspace(-1,1,500);
yy=exp(xx);

deg=[4 8 16 32]

for n=deg
  clf
  nodes=-1:2/n:1;
  y=exp(nodes);
  subplot(1,2,1)
  plot(xx,yy)
  hold on
  grid on  
  plot(nodes,y,'o')
  t1=sprintf('degree %d, equally spaced nodes',n);
  title(t1);
  xlabel('function in blue; interpolant in red');
  pause
  [c,N]=newtonIP(nodes,y);
  yInterpEqual=functionEval(N,xx);
  errEqual=yy-yInterpEqual;
  plot(xx,yInterpEqual,'r')
  
  nodes=chebyNodes(n);
  y=exp(nodes);
  subplot(1,2,2)
  plot(xx,yy)
  hold on
  grid on
  plot(nodes,y,'o')
  t2=sprintf('degree %d, Chebychev nodes',n);
  title(t2);
  xlabel('funtion in blue; interpolant in red');
  pause
  [c,N]=newtonIP(nodes,y);
  yInterpCheby=functionEval(N,xx);
  plot(xx,yInterpCheby,'r')
  errCheby=yy-yInterpCheby;
  pause
  
  clf
  subplot(1,2,1)
  plot(xx,errEqual);
  hold on
  title(sprintf('Error equally spaced, deg=%d',n))
  m=max(abs(errEqual));
  str=sprintf('Max absolute error is %1.5e',m);
  xlabel(str);
  plot([xx(1) xx(length(xx))],[0 0],'k');
  grid on
  
  subplot(1,2,2)
  plot(xx,errCheby);
  hold on
  title(sprintf('Error Chebychev nodes, deg=%d',n))
  grid on
  m=max(abs(errCheby));
  str=sprintf('Max absolute error is %1.5e',m);
  xlabel(str);
  plot([xx(1) xx(length(xx))],[0 0],'k');
  grid on
  pause
  
end


